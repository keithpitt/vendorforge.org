require 'spec_helper'

describe Vendor do

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
    vendor = Vendor.create(:name => "Something_goes !! \" HERE \#@%i")

    vendor.slug.should == "Something_goes-HERE-i"
  end

  context "#latest" do

    it "should return the latest vendors" do
      second = FactoryGirl.create(:vendor)
      first = FactoryGirl.create(:vendor)

      vendors = Vendor.latest.limit(2)

      vendors.first.should == first
      vendors.second.should == second
    end

  end

  context "#to_param" do

    it "should return the slug" do
      vendor.to_param.should == vendor.slug
    end

  end

end
