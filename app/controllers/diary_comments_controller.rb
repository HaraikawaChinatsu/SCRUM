class DiaryCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @diary = Diary.find(params[:diary_id])
    @diary_comment = DiaryComment.new(diary_comment_params)
    @diary_comment.diary_id = @diary.id
    @diary_comment.user_id = current_user.id
    unless @diary_comment.save
      render 'error'
    end
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    diary_comment = @diary.diary_comments.find(params[:id])
    diary_comment.destroy
  end

  private
  def diary_comment_params
    params.require(:diary_comment).permit(:comment)
  end
end
