class DiaryCommentsController < ApplicationController

  def create
    diary = Diary.find(params[:diary_id])
    comment = current_user.diary_comments.new(diary_comment_params)
    comment.diary_id = diary.id
    comment.save
    redirect_to diary_path(diary)
  end

  def destroy
    Diary.find_by(id: params[:id], diary_id: params[:diary_id]).destroy
    redirect_to diary_path(params[:diary_id])
  end

  private
  def diary_comment_params
    params.require(:diary_comment).permit(:comment)
  end


end
