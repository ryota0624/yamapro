class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def index
  	@users = User.order("number")
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root
    else
      render action: :new
    end

  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end


end
