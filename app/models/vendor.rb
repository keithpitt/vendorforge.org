class Vendor < ActiveRecord::Base

  belongs_to :user

  has_many :versions

  validates :name, :presence => true, :uniqueness => true

  serialize :authors

  def authors=(value)
    # Always ensure authors is an array
    super [ *value ]
  end

end
