class Version < ActiveRecord::Base

  belongs_to :vendor
  belongs_to :user

  validates :number, :presence => true

end
