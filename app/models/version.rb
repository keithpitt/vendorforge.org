require 'zip/zipfilesystem'

class Version < ActiveRecord::Base

  mount_uploader :package, PackageUploader

  belongs_to :vendor
  belongs_to :user

  validates :number, :presence => true

  before_validation :extract_vendor_spec, :if => :package_changed?

  def vendor_spec=(spec)
    raise spec.inspect
  end

  private

    def extract_vendor_spec
      Zip::ZipFile.open(package.current_path) do |zipfile|
        spec = zipfile.file.read("vendor.json")
        self.vendor_spec = JSON.parse(spec)
      end
    end

end
