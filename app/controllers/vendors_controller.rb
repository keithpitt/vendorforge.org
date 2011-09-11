class VendorsController < ApplicationController

  respond_to :html, :json

  before_filter :find_vendor, :only => [ :show ]
  before_filter :authenticate_user!, :only => [ :new, :create ]

  def index
    @vendors = Vendor.all
  end

  def new
    @version = current_user.versions.new
  end

  def create
    @version = current_user.versions.new(params[:version])

    if @version.save
      respond_with do |format|
        format.html {
          flash[:success] = "Vendor uploaded successfully"
          redirect_to @version.vendor
        }
        format.json {
          render :json => { :status => "ok", :url => vendor_path(@version.vendor) }
        }
      end
    else
      respond_with do |format|
        format.html {
          render :action => :new
        }
        format.json {
          render :json => { :status => "error", :message => @version.errors.full_messages.to_sentence }
        }
      end
    end
  end

  private

    def find_vendor
      id = params[:id]
      @vendor = Vendor.where{ lower(:slug) == id.downcase}.first if id.present?

      raise ActiveRecord::RecordNotFound.new("Vendor not found") unless @vendor.present?
    end

end
