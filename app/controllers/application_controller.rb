class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def logged_in?
    current_user != nil
  end

end
