class EssaysController < ApplicationController
  def index
    @essays = Essay.all()
  end
  def show
    @essay = Essay.find(params[:id])
  end
  def destory
    @essay = Essay.find(params[:id]).destory
  end
  def new
    @essay = Essay.new()
  end
  def create
    essay = Essay.new(essay_params)
    essay.user_id = current_user.id
    if essay.save
      redirect_to root_path
    else
      redirect_to new_essays_path
    end
  end

  private
  def essay_params
    params.require(:essay).permit(:text,:title,:pickup_f)
  end
end
