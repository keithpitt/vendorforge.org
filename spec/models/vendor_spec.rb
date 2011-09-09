require 'spec_helper'

describe Vendor do

  before :each do
    FactoryGirl.create(:vendor)
  end

  it { should belong_to(:user) }
  it { should have_many(:authors) }
  it { should have_many(:versions) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

end
