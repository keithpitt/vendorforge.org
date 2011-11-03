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

    it "should raise an error if the vendor cannot be found" do
      get :show, :id => "more-energy"

      response.should_not be_success
      response.status.should == 404
    end

  end

end
