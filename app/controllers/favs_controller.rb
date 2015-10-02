class FavsController < ApplicationController
  def create
    fav = Fav.post_to_fav(current_user.id, params[:post_id])
    if fav
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end
end
