require 'spec_helper'

describe VendorForge::Download do

  it { should belong_to(:version) }

  it { should validate_presence_of(:version) }

end
