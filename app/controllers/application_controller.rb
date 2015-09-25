class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :require_login, except: [:index]
  include ApplicationHelper
  helper_method :current_account, :logged_in?
end
