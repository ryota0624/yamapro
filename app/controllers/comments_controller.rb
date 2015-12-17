class CommentsController < ApplicationController
  def create 
    @newComment = Comment.new()
    @newComment.text = params[:text]
    @newComment.user_id = current_user.id
    @newComment.essay_id = params[:essay_id]
    if @newComment.save then
      redirect_to essay_path @newComment.essay_id   #そのうちコメント対象の記事へジャンプするようにする
    else 
      redirect_to essay_path params[:essay_id]
    end
  end
end
