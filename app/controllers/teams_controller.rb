class TeamsController < ApplicationController

  def new
    @team = Team.new
    # @team.users << current_user
  end

  def index
    @teams = Team.all
    # @team.users << current_user
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'チームを作成しました'
    else
      render :new
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :user_id, :introduction, :image, :minimum_people, :max_people )
  end

end
