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
      sorted = versions.sort.reverse
      first_non_prerelease = sorted.find { |version| !version.version.prerelease? }

      first_non_prerelease ? first_non_prerelease : sorted.first
    end

    def authors=(value)
      # Always ensure authors is an array
      super [ *value ]
    end

    def to_param
      slug
    end

    def as_json(options = {})
      {
        :name => name,
        :description => description,
        :release => release.number,
        :versions => versions.map { |v|
          [ v.number, { :dependencies => v.dependencies.map { |d| [ d.name, d.number ] } } ]
        }
      }
    end

    private

      def slugerize
        self.slug = name.slugerize
      end

  end
end
