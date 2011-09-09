class VendorsController < ApplicationController

  before_filter :find_vendor, :only => [ :show ]
  before_filter :authenticate_user!, :except => [ :show ]

  def new
    @version = current_user.versions.new
  end

  def create
    @version = current_user.versions.new(params[:version])

    if @version.save
      flash[:success] = "Vendor uploaded successfully"
      redirect_to @version.vendor
    else
      render :action => :new
    end
  end

  private

    def find_vendor
      id = params[:id]
      @vendor = Vendor.where{ lower(:slug) == id.downcase}.first if id.present?

      raise ActiveRecord::RecordNotFound unless @vendor.present?
    end

end
