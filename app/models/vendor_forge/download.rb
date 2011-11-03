module VendorForge
  class Download < ActiveRecord::Base

    belongs_to :vendor
    belongs_to :version

  end
end
