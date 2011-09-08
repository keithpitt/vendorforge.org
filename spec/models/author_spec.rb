require 'spec_helper'

describe Author do

  it { should belong_to(:vendor) }

  it { should validate_presence_of(:name) }

end
