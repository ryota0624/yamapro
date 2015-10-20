class EssaysController < ApplicationController
  def index
    @new_essays = Essay.where(pickup_f: false).limit(3)
    @essays = Essay.where(pickup_f: false)
  end
  def pickup
    @essays = Essay.where(pickup_f: true)
  end

  def show
    @essay = Essay.find(params[:id])
    @images = ImageEssay.where(essay_id: @essay.id)
    # send_data @images[0], :type => 'image/jpeg', :disposition => 'inline'
  end

  def tag_search #現状一つのタグに対してのみ
    tag_essay = TagEssay.where(tag_id: params[:tag_id])
    @essays = tag_essay.map { |essay| essay.essay }
  end

  def search
    result = Essay.keyword_search params[:keyword]
    @pickups = result[:pickup]
    @user_posts = result[:user_posts]
  end

  def new
    @image = ImageEssay.new
    @essay = Essay.new
  end
  
  def create
    essay = Essay.new(essay_params)
    if !essay.pickup_f 
      essay.pickup_f = false
    end
    essay.user_id = current_user.id
    if essay.save
      essay_id = essay.id
      images = {}
      image = {}
      logger.debug params
      upload_files = params[:image]
      upload_files.each do | file |
        logger.debug file[1]
        image[:img_name] = file[1].original_filename
        image[:image] = file[1].read
        @image = ImageEssay.new(image)
        @image.essay_id = essay_id
        @image.save
      end
      redirect_to root
    else
      redirect_to new_essays_path
    end
    #essay.add_tag(params[:tags])
  end
  def edit
    @essay = Essay.find(params[:id])
  end
  def update

  end

  def destory
    @essay = Essay.find(params[:id]).destory
  end

  def get_image
    @image = ImageEssay.find(params[:id])
    logger.debug @image
    send_data(@image.image, :disposition => "inline", :type => "image/jpeg")
  end


  private
  def essay_params
    params.require(:essay).permit(:text,:title,:pickup_f)
  end
end
