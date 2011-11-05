class VendorsController < ApplicationController

  respond_to :html, :json

  before_filter :find_vendor, :only => [ :show, :download ]
  before_filter :find_version, :only => [ :download ]

  before_filter :authenticate_user!, :only => [ :new, :create ]

  def index
    @vendors = VendorForge::Vendor.all
  end

  def new
    @version = current_user.versions.new
  end

  def show
    respond_to do |format|
      format.html
      format.json {
        render :json => @vendor.to_json
      }
    end
  end

  def download
    VendorForge::Download.create :version => @version

    redirect_to @version.package.url
  end

  def create
    @version = current_user.versions.new(params[:version])

    if @version.save
      respond_with do |format|
        format.html {
          flash[:success] = "Vendor uploaded successfully"
          redirect_to vendor_path(@version.vendor)
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
      id = params[:id] || params[:vendor_id]
      @vendor = VendorForge::Vendor.where{ lower(:slug) == id.downcase}.first if id.present?

      raise ActiveRecord::RecordNotFound.new("Vendor not found") unless @vendor.present?
    end

    def find_version
      @version = @vendor.versions.where(:number => params[:version]).first

      raise ActiveRecord::RecordNotFound.new("Version not found") unless @version.present?
    end

end
