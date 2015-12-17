class EssaysController < ApplicationController
  def index
    @link_bool = false
    @new_essays = Essay.where.not(question: true).where(pickup_f: false).limit(3)
    @essays = Essay.where.not(question: true).where(pickup_f: false).offset(3)
    .paginate(:page => params[:page], :per_page => 4)
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
    @new_essays = Essay.where(pickup_f: true).limit(3)
    @essays = Essay.where(pickup_f: true).limit(-1).offset(3).paginate(:page => params[:page], :per_page => 8)
    #@essays = Essay.where(pickup_f: true)
    post_img = @essays.map {|essay| ImageEssay.where(essay_id: essay.id).first }
    @posts_img = post_img.map {|essay|
      if essay.nil? then
        re = 0
      else
        re =  essay.id
      end
      re
    }
  end

  def question
    @link_bool = false
    # tag_essays = TagEssay.where(tag_id: 1)
    # @test = tag_essays.map do |item|
    #   item.essay_id
    # end
    @questions = Essay.where(question: true).paginate(:page => params[:page], :per_page => 8)
  end

  def question_fav
    @link_bool = true
    tag_essays = TagEssay.where(tag_id: 1)
    @test = tag_essays.map do |item|
      item.essay_id
    end
    @questions = Essay.where(id: @test)
    render :template => 'essays/question'
  end

  def show
    @essay = Essay.find(params[:id])
    @user = @essay.user
    logger.debug @essay
    session[:essay_id] = params[:id]
    @images = ImageEssay.where(essay_id: @essay.id)
    middleTags = TagEssay.where(essay_id: @essay.id)
    @tags = middleTags.map { |tag| Tag.find_by id: tag.tag_id }
    @comments = Comment.where(essay_id: @essay.id)
    @mylist_num = @essay.mylists
    if params[:page] then
      text = @essay.text.split "|"
      text.unshift("")
      page = params[:page].to_i
      if text[page] then
        @essay.text = text[page]
        @now_page_num = page
        @page_num = text.length
      end
    end
    if logged_in? then
      @fav = Mylist.where(user_id: current_user.id, essay_id: @essay.id)
      @fav = @fav[0]
    end
    post_img = ImageEssay.where(essay_id: @essay.id).first
      if post_img.nil? then
        re = 0
      else
        re =  post_img.id
      end
    re
    @essay_img = re

  end

  def tag_search #現状一つのタグに対してのみ
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
    @results = Essay.all
    if params[:tag_id] then
      tag_id = params[:tag_id]
      tag = Tag.find_by(id: tag_id)
      @message += tag.name
      @results = tag.tag_essays.map do |essay|
        Essay.find_by(id: essay.essay_id)
      end
    end
    logger.debug "jojoj"
    render :template => search_essays_path
  end

  def destory
    logger.debug params
    @essay = Essay.find(params[:id]).delete
    render json: @essay
  end

  def get_image
    @image = ImageEssay.find_by(id: params[:id])
    logger.debug @image
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
