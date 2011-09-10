class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [ :api_key ]
  before_filter :find_user, :only => [ :api_key ]

  def api_key
    if @user == current_user
      render :json => { :api_key => @user.authentication_token }
    else
      raise PermissionDenied.new("Not allowed")
    end
  end

  private

    def find_user
      id = params[:id]
      @user = User.where{ lower(:username) == id.downcase}.first if id.present?

      raise ActiveRecord::RecordNotFound.new("User not found") unless @user.present?
    end

end
