class PagesController < ApplicationController

  def index
    @latest_vendors = VendorForge::Vendor.latest.limit(5)
  end

end
