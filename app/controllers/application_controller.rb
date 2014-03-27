# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
  	@current_user ||= Usuario.find(session[:id]) if session[:id]
  end
  helper_method :current_user
end
