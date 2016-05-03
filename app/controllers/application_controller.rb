class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_admin?

  def is_admin?
    current_user && current_user.admin?
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
