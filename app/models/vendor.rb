class Vendor < ActiveRecord::Base

  belongs_to :user

  has_many :authors
  has_many :versions

  validates :name, :presence => true, :uniqueness => true

end
