class DiariesController < ApplicationController

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diaries_path
  end

  def index
    # @diaries = Diary.page(params[:page]).reverse_order
    @user = current_user
    @diaries = @user.diaries.page(params[:page]).per(10)
  end

  def show
    @diary = Diary.find(params[:id])
    @diary_comment = DiaryComment.new
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diaries_path(@diary), notice: "You have updated diary successfully."
    else
      render "edit"
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :date, :weight, :text, :image)
  end
end
