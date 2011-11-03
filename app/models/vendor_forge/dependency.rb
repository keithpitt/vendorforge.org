module VendorForge
  class Dependency < ActiveRecord::Base

    belongs_to :version

  end
end
