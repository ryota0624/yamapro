class EssaysController < ApplicationController
  def index
    @essays = Essay.where(pickup_f: false)
    logger.debug(@essays)
  end
  def pickup
    @essays = Essay.where(pickup_f: true)
  end

  def show
    @essay = Essay.find(params[:id])
  end

  def new
    @essay = Essay.new()
  end
  
  def create
    essay = Essay.new(essay_params)
    essay.user_id = current_user.id
    if essay.save
      essay.add_tag(params[:tags])
      redirect_to root_path
    else
      redirect_to new_essays_path
    end
    #essay.add_tag(params[:tags])
  end

  def destory
    @essay = Essay.find(params[:id]).destory
  end



  private
  def essay_params
    params.require(:essay).permit(:text,:title,:pickup_f)
  end
end
