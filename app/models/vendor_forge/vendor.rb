module VendorForge
  class Vendor < ActiveRecord::Base

    belongs_to :user

    has_many :versions, :dependent => :destroy

    validates :name, :presence => true, :uniqueness => true
    validates :slug, :presence => true, :uniqueness => true
    validates :user, :presence => true

    serialize :authors

    before_validation :slugerize, :if => :name_changed?

    scope :latest, order('created_at desc')

    def release
      versions.last
    end

    def authors=(value)
      # Always ensure authors is an array
      super [ *value ]
    end

    def to_param
      slug
    end

    private

      def slugerize
        self.slug = name.slugerize
      end

  end
end
