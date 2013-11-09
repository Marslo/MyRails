class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDeined do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
