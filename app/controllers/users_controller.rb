class UsersController < ApplicationController

  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries
    @diary = Diary.new
    # @team = Team.find(params[:team_id])
  end

  def index
    @users = User.all
    @diary = Diary.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render "edit"
    end
  end

  def graph
    sum = 0
    gon.bardata = []
    gon.linedata = []
    6.times do |i|
      data = rand(100.0)
      gon.bardata << data
      sum = sum + data
      gon.linedata << sum
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :age, :target_weight, :weight, :public_status)
  end
end
