module ApplicationHelper
  def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_login
      unless current_user
        redirect_to root_path
        return false
      end
    end

    def logged_in?
      current_user_session != nil
    end

    def post_to_fav(user_id, post_id)
      Fav.post_to_fav(user_id, post_id)
      redirect_to root_path
    end
end
