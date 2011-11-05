module VendorForge
  class Download < ActiveRecord::Base

    belongs_to :version

  end
end
