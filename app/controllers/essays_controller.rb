class EssaysController < ApplicationController
  def index
    @link_bool = false
    @essays = Essay.where(pickup_f: false)
    .paginate(:page => params[:page], :per_page => 7)
  end

  def fav
    @link_bool = true
    essayLength = Essay.where.not(question: true).where(pickup_f: false).map do |item|
      item.mylists.length
    end
    essays = Essay.where(pickup_f: false).where.not(question: true)
    essayArray = essays.map.with_index do |item, i|
      [item, essayLength[i]]
    end
    essayArray.reverse! do |item|
      item[1]
    end
    essayArray.map! do |item|
      item[0]
    end
    @new_essays = essayArray.slice(0,3)
    @essays = essayArray.slice(@new_essays.length, 4)
    render :template => 'essays/index'
  end

  def pickup
    @essays = Essay.where(pickup_f: true).paginate(:page => params[:page], :per_page => 8)
    @posts_img = @essays.map {|essay| essay.img_id}
  end

  def question
    @link_bool = false
    @questions = Essay.where(question: true).paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @essay = Essay.find(params[:id])
    @user = @essay.user
    @images = ImageEssay.where(essay_id: @essay.id)
    @tags = @essay.get_tags
    @comments = Comment.where(essay_id: @essay.id)
    @mylist_num = @essay.mylists
		text = @essay.text.split "|"
		page = Proc.new {|page|
			page ? page -1 : 0
		}.call params[:page].to_i
		@essay.text = text[page]
    @now_page_num = page
    @page_num = text.length
    if logged_in? then
      @fav = Mylist.where(user_id: current_user.id, essay_id: @essay.id)[0]
    end
    @essay_img = @essay.img_id
		    session[:essay_id] = params[:id]
  end
	
  def tag_search
    tag_essays = TagEssay.where(tag_id: params[:tag_id])
    @essays = tag_essays.map { |essay| essay.essay }
    @essays.select! do |essay| 
      !essay.question
    end
  end

  def search
    @message = '検索キーワード: '+ params[:keyword]
    result = Essay.where.not(question: true)
    .keyword_search params[:keyword]
    pickups = result[:pickup]
    user_posts = result[:user_posts]
    @results = pickups.concat user_posts
  end

  def title_search
    @message = '検索キーワード: '+ params[:keyword]
    result = Essay.where.not(question: true)
    .title_search params[:keyword]
    pickups = result[:pickup]
    user_posts = result[:user_posts]
    @results = pickups.concat user_posts
    render :template => 'essays/search'
  end

  def new
    @image = ImageEssay.new
    @tags = Tag.all.offset(1)
    @essay = Essay.new
		render :layout => false
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
      essay.question = true
      essay.save
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

  def tags 
    @tags = Tag.all
  end

  def tag
    @message = '検索タグ: '
    if params[:tag_id] then
      tag_id = params[:tag_id]
      @results = Tag.find_by(id: tag_id).get_essays
		else 
			@results = Essay.all
    end
    render :template => search_essays_path
  end

  def destory
    @essay = Essay.find(params[:id]).delete
    render json: @essay
  end

  def get_image
    @image = ImageEssay.find_by(id: params[:id])
    if @image then
      send_data(@image.image, :disposition => "inline", :type => "image/jpeg")
    else
      send_file("./public/images/no_img.png", :disposition => "inline", :type => "image/png")
    end
  end
	
  private
  def essay_params
    params.require(:essay).permit(:text,:title,:pickup_f)
  end
end