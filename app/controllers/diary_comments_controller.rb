class DiaryCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @diary = Diary.find(params[:diary_id])
    @diary_comment = DiaryComment.new(diary_comment_params)
    @diary_comment.diary_id = @diary.id
    @diary_comment.user_id = current_user.id
    unless @diary_comment.save
      render 'error'  # app/views/book_comments/error.js.erbを参照する
    end
    # app/views/book_comments/create.js.erbを参照する
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
    # app/views/book_comments/destroy.js.erbを参照する
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
