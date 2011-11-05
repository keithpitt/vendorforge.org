module VendorForge
  class Download < ActiveRecord::Base

    belongs_to :version

    validates :version, :presence => true

    scope :latest, order('created_at desc')

  end
end
