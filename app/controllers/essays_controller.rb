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
    redirect_to root_path
  end

  private
  def essay_params
    params.require(:essay).permit(:text,:title)
  end
end
