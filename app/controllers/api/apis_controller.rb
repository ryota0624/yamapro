class Api::ApisController < ApplicationController
  protect_from_forgery
  #protect_from_forgery with: :null_session
  def user
    @users = User.all
    render json: @users
  end

  def add_user
    logger.debug params
    @user = User.new()
    @user.name = params[:name]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    logger.debug params[:admin] == "true"
    if params[:admin] == "true" then
      @user.admin = true
    else
      @user.admin = false
    end
     @user.gender = params[:gender].to_i
     logger.debug @user
    if @user.save
      render json: @user
    else
      #render json: {"error": "error"}
    end
  end

  def delete_user
    #logger.debug params[:id]
    @user = User.find(params[:id].to_i)#.destroy
    @user.delete
    render json: @user
  end

  def essay
    @essays = Essay.all
    render json: @essays
  end

  def add_essay
    logger.debug params
    @essay = Essay.new()
    @essay.title = params[:title]
    @essay.text = params[:text]
    @essay.md = true
    @essay.user_id = params[:user_id].to_i
    if params[:pickup_f] == "true" then
      @essay.pickup_f = true
    else
      @essay.pickup_f = false
    end
    if @essay.save
      render json: @essay
    else
      #render json: {"error": "error"}
    end
  end

  def delete_essay
    logger.debug params[:esssay_id]
   @essay = Essay.find(params[:essay_id])
   @essay.delete
   render json: @essay
  end

  def get_images
    @images = ImageEssay.select(:id,:essay_id).where(essay_id: params[:essay_id])
    render json: @images
  end

  def get_tags
    @tags = Tag.all
    render json: @tags
  end

  def create_tag
    @tag = Tag.new()
    @tag.name = params[:name]
    if @tag.save
      render json: @tag
    end
  end

  def delete_tag
    @tag = Tag.find(params[:id])
    @tag.delete
    render json: @tag
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :gender)
  end

  def use_before_action?
    false
  end
end
