require 'spec_helper'

describe VendorsController do

  let(:user) { FactoryGirl.create(:user) }

  context "#new" do

    context "with a current user" do

      before :each do
        sign_in user
      end

      it "should create an new instance of a version object" do
        get :new

        response.should be_success
        assigns[:version].should be_kind_of(VendorForge::Version)
        assigns[:version].should_not be_persisted
      end

    end

    context "with no user" do

      it "should redirect to login" do
        get :new

        response.should_not be_success
        response.should redirect_to(new_user_session_path)
      end

    end

  end

  context "#create" do

    let(:upload) { Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1.vendor") }
    let(:invalid_upload) { Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1-broken.vendor") }

    context "with a current user" do

      before :each do
        sign_in user
      end

      it "should create a new vendor with a valid package" do
        expect do
          post :create, :version => { :package => fixture_file_upload(upload) }

          response.should redirect_to("/vendors/DKBenchmark")
        end.should change(VendorForge::Vendor, :count).by(1)
      end

      it "should render the new page an invalid package" do
        expect do
          post :create, :version => { :package => fixture_file_upload(invalid_upload) }

          response.should be_success
          response.should render_template(:new)
        end.should change(VendorForge::Vendor, :count).by(0)
      end

    end

    context "with no user" do

      it "should redirect to login" do
        post :create, :version => { :package => upload }

        response.should_not be_success
        response.should redirect_to(new_user_session_path)
      end

    end

  end

  context "#show" do

    let!(:vendor) { FactoryGirl.create(:vendor) }

    it "should find a vendor record based on the slug regardless of case" do
      get :show, :id => vendor.slug.upcase

      response.should be_success
      assigns[:vendor].should == vendor
    end

    it "should use the release version as the default version to show" do
      get :show, :id => vendor.slug.upcase

      response.should be_success
      assigns[:version].should == vendor.release
    end

    it "should allow you to pass a different version to the vendor" do
      version1 = VendorForge::Version.create(:user => vendor.user,
                                             :package => File.open(Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1.vendor")))
      version2 = VendorForge::Version.create(:user => vendor.user,
                                             :package => File.open(Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.2.vendor")))

      get :show, :vendor_id => "DKBenchmark", :version => "0.2"

      response.should be_success
      assigns[:version].should == version2
    end

    it "should raise an error if the vendor cannot be found" do
      get :show, :id => "more-energy"

      response.should_not be_success
      response.status.to_i.should == 404
    end

    it "should show a json version of the library" do
      get :show, :id => vendor.slug.upcase, :format => :json

      response.should be_success
      json = JSON.parse(response.body)
      json['name'].should == vendor.name
      json['release'].should == vendor.release.number
    end

    it "should return a status of 404 if requesting JSON and the vendor doesn't exist" do
      get :show, :id => "DoestNotExist", :format => :json

      response.should_not be_success
      response.status.to_i.should == 404
      json = JSON.parse(response.body)
      json['status'].should == "error"
      json['message'].should == "Vendor not found"
    end

  end

  context "#destroy" do

    let!(:version) { Factory.create(:version, :user => user) }

    context "with a current user" do

      before :each do
        version.vendor.update_attribute :user, user
        version.update_attribute :user, user

        sign_in user
      end

      it "should destroy the vendor" do
        expect do
          delete :destroy, :id => version.vendor.name

          response.should redirect_to(vendor_path(version.vendor))
        end.should change(VendorForge::Version, :count).by(-1)
      end

      it "should return a 404 if the vendor couldn't be found" do
        delete :destroy, :id => "DoesNotExist"

        response.status.should == 404
      end

      it "should redirect if the user didn't upload the version" do
        version.update_attribute :user, Factory.create(:user)
        delete :destroy, :id => version.vendor.name

        response.status.should == 403
      end

    end

    context "with no user" do

      it "should redirect to login" do
        delete :destroy, :id => version.vendor.name

        response.should_not be_success
        response.should redirect_to(new_user_session_path)
      end

    end

  end

  context "#download" do

    let(:package) { File.open(Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1.vendor")) }
    let!(:version) { Factory.create(:version, :package => package) }

    it "should find the version based on its number" do
      get :download, :vendor_id => "DKBenchmark", :version => "0.1"

      assigns[:version].should == version
    end

    it "should redirect to the download path of the version" do
      get :download, :vendor_id => "DKBenchmark", :version => "0.1"

      response.should redirect_to version.package.url
    end

    it "should create a download record" do
      expect do
        get :download, :vendor_id => "DKBenchmark", :version => "0.1"
      end.should change(VendorForge::Download, :count).by(1)

      VendorForge::Download.latest.first.version.should == version
    end

    it "should return a 404 if the vendor couldn't be found" do
      get :download, :vendor_id => "DoesNotExist", :version => "0.1"

      response.status.should == 404
    end

    it "should return a 404 if the version couldn't be found" do
      get :download, :vendor_id => "DKBenchmark", :version => "3.5.2.alpha"

      response.status.should == 404
    end

  end

end
