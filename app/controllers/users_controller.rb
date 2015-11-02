class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def index
    @users = User.all
    @image = UserImage.where(user_id: 8)
  end

  def show
    @user = User.find(params[:id])
    @image = UserImage.where(user_id: @user.id)
    # if params[:format].in?(["jpg", "png", "gif"])
    #   send_image
    # else
    #   # render "users/show"
    # end
  end

  def new
  	@user = User.new
    # @user.bulid_image
    @image = UserImage.new
  end

  def edit
    @user = User.find(params[:id])
    @user.build_image unless @user.image
  end

  def create
    @user = User.new(user_params)
    if @user.save
      image = {}
      upload_files = params[:image]
      image[:data] = upload_files.read
      @image = UserImage.new(image)
      @image.user_id = @user.id
      @image.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def update
    @user = User.find(params[:id])
    # if @user.update(user_params)
    #   user_id = @user.id
    #   image = {}
    #   upload_files = params[:image]
    #   image[:data] = upload_files.read
    #   @image = UserImage.new(image)
    #   @image.user_id = user_id
    #   @image.save
    #   redirect_to mypages_path , notice: "会員情報を更新しました。"
    # else
    #   render 'index/mypage'
    # end
    #
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
        send_data @user.image.data,
          type: @user.image.content_type, disposition: "inline"
      else
        # raise NotFound
      end
    end

end
