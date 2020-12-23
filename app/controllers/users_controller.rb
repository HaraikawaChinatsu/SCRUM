class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit, :update]

  def mypage
    @user = current_user
    @diaries = current_user.diaries
    @diary = Diary.new
  end

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
    if current_user.update(user_params)
      redirect_to mypage_path(current_user), notice: '会員情報の更新が完了しました。'
    else
      render 'edit'
    end
  end

  def graph
    gon.weight = []
    current_user.diaries.each do |diary|
      gon.weight << current_user.weight
    end

    gon.target_weights = []
    gon.diaries = []
    current_user.diaries.each do |diary|
      gon.target_weights << current_user.target_weight
      gon.diaries << diary.date.strftime('%m月%d日')
    end
    sum = 0
    gon.bardata = []
    gon.linedata = []
    6.times do |_i|
      data = rand(100.0)
      gon.bardata << data
      sum += data
      gon.linedata << sum
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :age, :target_weight, :weight,
                                 :public_status, :body, :image)
  end
end
