class ApplicationController < ActionController::Base

  class PermissionDenied < StandardError; end

  protect_from_forgery

  rescue_from (ActiveRecord::RecordNotFound) { |exception| render_error(exception, 404) }
  rescue_from (PermissionDenied) { |exception| render_error(exception, 403) }

  private

    def render_error(exception, status)
      if params[:format] == "json"
        render :json => { :status => "error", :message => exception.message }, :status => status
      else
        render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
      end
    end

end
