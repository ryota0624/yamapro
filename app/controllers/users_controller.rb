class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def index
    @users = User.all
    @image = UserImage.where(user_id: 8)
  end

  def show
    @user = User.find(params[:id])
    @image = UserImage.where(user_id: @user.id)
    @essays = @user.essays
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "users/show"
    end
  end

  def new
  	@user = User.new
    @image = UserImage.new
    # @user.bulid_image
  end

  def edit
    @user = User.find(params[:id])
    work = TagUser.where(user_id: current_user.id)
    @tag = Usertag.where(id: work[0].tag_id)
    @tag = @tag[0]

    @user.build_image unless @user.image
  end

  def create
    @user = User.new(user_params)
    @tag = Usertag.new(fage: "未設定", mage: "未設定", place: "未設定")
    @middle = TagUser.new(user_id: User.count + 1, tag_id: Usertag.count + 1)
    if @user.save && @tag.save && @middle.save
      redirect_to root_path
    else
      render action: :new
    end

  end

  def update
    @user = User.find(params[:id])
    work = TagUser.where(user_id: current_user.id)
    @tag = Usertag.where(id: work[0].tag_id)
    if @user.update(user_params) && @tag[0].update(user_tag_params)
      redirect_to mypages_path , notice: "会員情報を更新しました。"
    else
      render 'index/mypage'
    end

  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :gender, :business, :data, :content_type, :usertag, image_attributes: [:image, :id, :uploaded_image])
    end

    def user_tag_params
      params.require(:usertag).permit(:fage, :mage, :place)
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
