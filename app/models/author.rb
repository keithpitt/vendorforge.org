class Author < ActiveRecord::Base

  belongs_to :vendor

  validates :name, :presence => true

end
