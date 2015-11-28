class EssaysController < ApplicationController
  def index
    @new_essays = Essay.where(pickup_f: false).limit(3)
    #@essays = Essay.where(pickup_f: false).limit(-1).offset(3)
    @essays = Essay.where(pickup_f: false).limit(-1).offset(3).paginate(:page => params[:page], :per_page => 8)
    logger.debug(@essays)
  end

  def pickup
    @new_essays = Essay.where(pickup_f: true).limit(3)
    @essays = Essay.where(pickup_f: true).limit(-1).offset(3).paginate(:page => params[:page], :per_page => 8)
    #@essays = Essay.where(pickup_f: true)
  end

  def question
    # tag_essays = TagEssay.where(tag_id: 1)#質問タグの番号を決めて打つ
    # @questions = tag_essays.map{ |essay| essay.essay }
    #render :json => { error: "ごめんちゃいまで用意してないんご"}
    @questions = Essay.all.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @essay = Essay.find(params[:id])
    logger.debug @essay
    session[:essay_id] = params[:id]
    @images = ImageEssay.where(essay_id: @essay.id)
    middleTags = TagEssay.where(essay_id: @essay.id)
    @tags = middleTags.map { |tag| Tag.find(tag.tag_id) }
    @comments = Comment.where(essay_id: @essay.id)
    @mylist_num = @essay.mylists
    if params[:page] then
      text = @essay.text.split "-"
      text.unshift("")
      page = params[:page].to_i
      if text[page] then
        @essay.text = text[page]
        @now_page_num = page
        @page_num = text.length
      end
    end
    if logged_in? then 
      @fav = Mylist.where(user_id: current_user.id,essay_id: @essay.id)
      @fav = @fav[0]
    end
  end

  def tag_search #現状一つのタグに対してのみ
    tag_essays = TagEssay.where(tag_id: params[:tag_id])
    @essays = tag_essays.map { |essay| essay.essay }
  end

  def search
    result = Essay.keyword_search params[:keyword]
    pickups = result[:pickup]
    user_posts = result[:user_posts]
    @results = pickups.concat user_posts
  end

  def new
    @image = ImageEssay.new
    @tags = Tag.all 
    @essay = Essay.new
  end

  def create
    logger.debug params
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
      if upload_files then
        upload_files.each do | file |
          logger.debug file[1]
          image[:img_name] = file[1].original_filename
          image[:image] = file[1].read
          @image = ImageEssay.new(image)
          @image.essay_id = essay_id
          @image.save
        end
      end
      redirect_to root_path
    else
      redirect_to new_essays_path
    end
    tags = params[:tags]
    if params[:tou] == "question" then
      essay.add_tag([1])
    end
    if tags then
      tags.uniq!
      essay.add_tag(params[:tags])
    end
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
    send_data(@image.image, :disposition => "inline", :type => "image/jpeg")
  end


  private
  def essay_params
    params.require(:essay).permit(:text,:title,:pickup_f)
  end
end
