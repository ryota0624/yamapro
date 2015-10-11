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
    @images = ImageEssay.where(essay_id: @essay.id)
    # send_data @images[0], :type => 'image/jpeg', :disposition => 'inline'
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
    image = {}
    upload_file = params[:image]
    if upload_file != nil
      image[:img_name] = upload_file.original_filename
      image[:image] = upload_file.read
    end
    @image = ImageEssay.new(image)
    logger.debug(upload_file)
    if essay.save
      @image.essay_id = essay.id
      if @image.save
        logger.debug("oKOKOKOKOOOKOO")
      else
        logger.debug(@image)
      end
      #essay.add_tag(params[:tags])
      redirect_to root_path
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
