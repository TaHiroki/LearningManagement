class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :login_required

  private

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id].present?
  end

  def login_required
    redirect_to login_users_path unless @current_user
  end
  
end
