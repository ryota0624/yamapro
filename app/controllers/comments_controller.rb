class CommentsController < ApplicationController
  def create 
    @newComment = Comment.new()
    @newComment.text = params[:text]
    @newComment.user_id = params[:user_id]
    @newComment.essay_id = params[:essay_id]
    if @newComment.save then
      redirect_to root_path   #そのうちコメント対象の記事へジャンプするようにする
    end
  end
end
