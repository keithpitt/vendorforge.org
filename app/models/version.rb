require 'zip/zipfilesystem'

class Version < ActiveRecord::Base

  serialize :vendor_spec

  mount_uploader :package, PackageUploader

  belongs_to :vendor
  belongs_to :user

  validates :number, :presence => true

  before_validation :extract_vendor_spec, :if => :package_changed?
  before_validation :update_from_vendor_spec, :if => :vendor_spec_changed?

  def vendor_spec=(value)
    super HashWithIndifferentAccess.new(value)
  end

  private

    def extract_vendor_spec
      Zip::ZipFile.open(package.current_path) do |zipfile|
        spec = zipfile.file.read("vendor.json")
        self.vendor_spec = JSON.parse(spec)
      end
    end

    def update_from_vendor_spec
      spec = HashWithIndifferentAccess.new(vendor_spec)
      existing = Vendor.where(:name => vendor_spec[:name]).first

      if existing.present?
        if existing.user == user
          if existing.versions.where(:number => vendor_spec[:version]).exists?
            errors.add :number, :existing_version
            return false
          else
            self.vendor = existing
          end
        else
          errors.add :vendor, :permission_denied
          return false
        end
      else
        self.vendor = Vendor.new(:name => vendor_spec[:name], :user => user)
      end

      [ :authors, :homepage, :github, :description, :email ].each do |attr|
        vendor.send("#{attr}=", vendor_spec[attr])
      end

      self.number = vendor_spec[:version]
    end

end
