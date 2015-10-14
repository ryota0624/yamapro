class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @user = :current_user
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      # render "users/show"
    end
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
    # @user.build_image unless @user.image
  end

  def editpass  #パスワード再設定
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  # user.dateにfile_read

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypages_path , notice: "会員情報を更新しました。"
    else
      render 'index/mypage'
    end
  end


  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :gender, :data, :content_type)
    end

    def send_image
      if @user.present?
        send_data @user.data,
          type: @user.content_type, disposition: "inline"
      else
        # raise NotFound
      end
    end

end
