require 'spec_helper'

describe Download do

  it { should belong_to(:vendor) }
  it { should belong_to(:version) }

end
