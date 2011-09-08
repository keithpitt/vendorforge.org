require 'spec_helper'

describe Vendor do

  before :each do
    FactoryGirl.create(:vendor)
  end

  it { should belong_to(:user) }
  it { should have_many(:authors) }
  it { should have_many(:versions) }

end
