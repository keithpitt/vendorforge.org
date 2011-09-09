class Vendor < ActiveRecord::Base

  belongs_to :user

  has_many :versions

  validates :name, :presence => true, :uniqueness => true
  validates :slug, :presence => true, :uniqueness => true
  validates :user, :presence => true

  serialize :authors

  before_validation :slugerize, :if => :name_changed?

  def authors=(value)
    # Always ensure authors is an array
    super [ *value ]
  end

  def to_param
    slug
  end

  private

    def slugerize
      self.slug = name.gsub(/[^a-zA-Z0-9\-\_\s]/, ' ').gsub(/\s+/, '-')
    end

end
