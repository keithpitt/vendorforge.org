class Vendor < ActiveRecord::Base

  mount_uploader :package, VendorUploader

  belongs_to :user

  has_many :authors
  has_many :versions

end
