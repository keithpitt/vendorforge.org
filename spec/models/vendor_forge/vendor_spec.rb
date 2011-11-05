require 'spec_helper'

describe VendorForge::Vendor do

  let!(:vendor) { FactoryGirl.create(:vendor) }

  it { should belong_to(:user) }
  it { should have_many(:versions) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
  it { should validate_presence_of(:user) }

  it "should serialize authors" do
    vendor.authors = [ "Keith Pitt", "Mario Visic" ]
    vendor.save!

    vendor.authors.should == [ "Keith Pitt", "Mario Visic" ]
  end

  it "should create a slug of the name" do
    vendor = VendorForge::Vendor.create(:name => "Something_goes !! \" HERE \#@%i")

    vendor.slug.should == "Something_goes-HERE-i"
  end

  context "#latest" do

    it "should return the latest vendors" do
      second = FactoryGirl.create(:vendor)
      first = FactoryGirl.create(:vendor)

      vendors = VendorForge::Vendor.latest.limit(2)

      vendors.first.should == first
      vendors.second.should == second
    end

  end

  context "#release" do

    it "should return the latest version" do
      vendor.versions.build :number => "1.5"
      vendor.versions.build :number => "1.5.2"
      vendor.versions.build :number => "2"
      vendor.versions.build :number => "2.3.2"

      vendor.release.number.should == "2.3.2"
    end

    it "should try and ignore pre-release versions" do
      vendor.versions.build :number => "1.5"
      vendor.versions.build :number => "1.5.2"
      vendor.versions.build :number => "2.3.2.alpha1"
      vendor.versions.build :number => "2"
      vendor.versions.build :number => "2.3.1"
      vendor.versions.build :number => "2.3.5.alpha1"
      vendor.versions.build :number => "2.3.5.alpha2"
      vendor.versions.build :number => "2.3.5.alpha3"

      vendor.release.number.should == "2.3.1"
    end

  end

  context "#as_json" do

    it "should return the json version of the vendor" do
      vendor.as_json.should == {
        :name => vendor.name,
        :description => vendor.description,
        :release => vendor.release.number,
        :versions => vendor.versions.map(&:number),
        :dependencies => vendor.versions.sort.map { |v| [ v.number, v.dependencies.map { |d| [ d.name, d.number ] } ] }
      }
    end

  end

  context "#to_param" do

    it "should return the slug" do
      vendor.to_param.should == vendor.slug
    end

  end

end
