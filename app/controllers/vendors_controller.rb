class VendorsController < ApplicationController

  def new
    @vendor = current_user.vendors.build
  end

  def create
    @vendor = current_user.vendors.build(params[:vendor])

    if @vendor.save!
      redirect_to :root
    else
      render :action => :new
    end
  end

end
