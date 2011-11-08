class PagesController < ApplicationController

  def index
    @latest_vendors = VendorForge::Vendor.latest.includes(:user).limit(5)
    @downloaded_vendors = VendorForge::Vendor.downloaded.includes(:user).limit(5)
    @updated_vendors = VendorForge::Vendor.updated.includes(:user).limit(5)
  end

end
