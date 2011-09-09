class PagesController < ApplicationController

  def index
    @latest_vendors = Vendor.latest.limit(5)
  end

end
