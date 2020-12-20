class TeamsController < ApplicationController
  def new
    @team = Team.new
    # @team.users << current_user
  end

  def index
    @teams = Team.all
    @team_members = TeamMember.all
    # @team.users << current_user
  end

  def create
    @team = Team.new(team_params)
    # チームの作成者
    @team.user_id = current_user.id
    # チームに所属するユーザーの中にも、current_userが入る
    @team.users << current_user
    if @team.save
      redirect_to teams_path, notice: 'チームを作成しました'
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    # チームのメンバーが入る
    @team_members = TeamMember.where(team_id: @team.id)
    user_ids = TeamMember.where(team_id: @team.id).pluck(:user_id)
    pp @team_members
    # チームメンバーから、ユーザーIDをとってくる
    @diaries = Diary.where(user_id: user_ids)
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :introduction, :image, :minimum_people, :max_people)
  end
end
