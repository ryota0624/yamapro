class Api::ApisController < ApplicationController
  protect_from_forgery
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
      render json: {"error": "error"}
    end
  end

  def delete_user
    logger.debug params[:id].to_i
    @user = User.find(params[:id].to_i).destroy
    render json: @user
  end

  def essay
    @essays = Essay.all
    render json: @essays
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :gender)
  end

  def use_before_action?
    false
  end
end
