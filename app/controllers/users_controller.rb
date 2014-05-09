class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_owner!
  before_action :set_user, only: [:show]

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def authenticate_owner!
      if user_signed_in? && current_user.id == params[:id].to_i
        return
      else
        redirect_to root_url, :notice => "You must have permission to access this page."
      end
    end
end
