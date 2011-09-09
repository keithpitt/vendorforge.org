class VendorsController < ApplicationController

  def new
    @version = Version.new
  end

  def create
    @version = Version.new(params[:version])
    @version.user = current_user

    if @version.save
      redirect_to @version.vendor
    else
      render :action => :new
    end
  end

end
