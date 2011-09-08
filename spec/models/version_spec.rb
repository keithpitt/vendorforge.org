require 'spec_helper'

describe Version do

  it { should belong_to(:vendor) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:number) }

end
