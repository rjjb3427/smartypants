class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  def current_user
    super || OpenStruct.new(full_name: 'Guest')
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to access this page."
    redirect_to(request.referrer || root_path)
  end
end
