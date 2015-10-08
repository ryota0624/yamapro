class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :logged_in?
  before_action :require_login, except: [:index, :show] ,if: :use_before_action?
  before_action :allow_cross_domain_access
  include ApplicationHelper
  helper_method :current_account, :logged_in?

  def use_before_action?
    true
  end

  def allow_cross_domain_access
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "*"
  end
end

