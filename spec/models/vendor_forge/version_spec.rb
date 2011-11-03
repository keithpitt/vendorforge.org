require 'spec_helper'

describe VendorForge::Version do

  it { should belong_to(:vendor) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:user) }

  it "should have the package uploader mounted" do
    VendorForge::Version.uploaders[:package].should == PackageUploader
  end

  context "uploading a vendor" do

    it "should load in the vendor spec" do
      vendor = File.open(Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1.vendor"))
      version = VendorForge::Version.new(:package => vendor)
      version.save

      version.vendor.name.should == "DKBenchmark"
      version.number.should == "0.1"
    end

    it "should return an error if the vendor package's spec is missing" do
      vendor = File.open(Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1-missing.vendor"))
      version = VendorForge::Version.new(:package => vendor)
      version.save

      version.errors[:package].should_not be_nil
    end

    it "should return an error if the vendor package's spec is broken" do
      vendor = File.open(Rails.root.join("spec", "resources", "vendors", "DKBenchmark-0.1-broken.vendor"))
      version = VendorForge::Version.new(:package => vendor)
      version.save

      version.errors[:package].should_not be_nil
    end

  end

  context 'setting a vendor spec' do

    let(:user) { FactoryGirl.create(:user) }
    let(:other_user) { FactoryGirl.create(:user) }

    let(:existing_vendor_spec) {
        { :authors =>"keithpitt", :files => ["DKBenchmark.h", "DKBenchmark.m"],
          :homepage =>"http://www.keithpitt.com", :source => "https://github.com/keithpitt/DKBenchmark",
          :description =>"Easy benchmarking in Objective-C using blocks", :name => "DKBenchmark",
          :email =>"me@keithpitt.com", :version => "0.1" }
    }

    let(:new_vendor_spec) {
        { "authors"=> ["keithpitt", "mariovisic" ], "files"=>["DKBenchmark.h", "DKBenchmark.m"],
          "homepage"=>"http://www.mariovisic.com", "source"=>"https://github.com/mariovisic/DKBenchmark",
          "description"=>"Easy benchmarking with cheese", "name"=>"DKBenchmark",
          "email"=>"mario@mariovisic.com", "version"=>"0.2" }
    }

    context 'with an existing vendor' do

      let!(:existing) { FactoryGirl.create(:vendor, :name => "DKBenchmark", :user => user) }

      it 'should use an existing vendor owned by the user if it exists' do
        version = VendorForge::Version.new(:user => user, :vendor_spec => new_vendor_spec)
        version.save

        version.vendor.should == existing
      end

      it "should add an error if the user doesn't own the existing vendor" do
        version = VendorForge::Version.new(:user => other_user, :vendor_spec => new_vendor_spec)

        version.save.should be_false
        version.errors[:vendor].should_not be_nil
      end

      it 'should overwrite atributes on the existing vendor' do
        version = VendorForge::Version.new(:user => user, :vendor_spec => new_vendor_spec)
        version.save

        version.vendor.authors.should == [ "keithpitt", "mariovisic" ]
        version.vendor.homepage.should == "http://www.mariovisic.com"
        version.vendor.source.should == "https://github.com/mariovisic/DKBenchmark"
        version.vendor.description.should == "Easy benchmarking with cheese"
        version.vendor.email.should == "mario@mariovisic.com"
      end

      it 'should increase the version count on the verndors versions' do
        expect do
          VendorForge::Version.create(:user => user, :vendor_spec => new_vendor_spec)
        end.should change(existing.versions, :count).by(1)
      end

      it "should not allow you upload an existing version" do
        version = VendorForge::Version.new(:user => user, :vendor_spec => existing_vendor_spec)

        version.save.should be_false
        version.errors[:vendor].should_not be_nil
      end

      it "should only update the vendor attributes if the new version record has a higher number than the current version"

    end

    context "with a new vendor" do

      let!(:version) { VendorForge::Version.create(:user => user, :vendor_spec => existing_vendor_spec) }

      it "should create a vendor" do
        version.vendor.name.should == "DKBenchmark"
      end

      it "should set the authors for the vendor" do
        version.vendor.authors.should == [ "keithpitt" ]
      end

      it "should set the homepage for the vendor" do
        version.vendor.homepage.should == "http://www.keithpitt.com"
      end

      it "should set the source link for the vendor" do
        version.vendor.source.should == "https://github.com/keithpitt/DKBenchmark"
      end

      it "should set the contact email for the vendor" do
        version.vendor.email.should == "me@keithpitt.com"
      end

      it "should set the vendor spec" do
        version.vendor_spec.should == HashWithIndifferentAccess.new(existing_vendor_spec)
      end

    end

  end

end
