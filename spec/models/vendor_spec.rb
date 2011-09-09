require 'spec_helper'

describe Vendor do

  let!(:vendor) { FactoryGirl.create(:vendor) }

  it { should belong_to(:user) }
  it { should have_many(:versions) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it "should serialize authors" do
    vendor.authors = [ "Keith Pitt", "Mario Visic" ]
    vendor.save!

    vendor.authors.should == [ "Keith Pitt", "Mario Visic" ]
  end

end
