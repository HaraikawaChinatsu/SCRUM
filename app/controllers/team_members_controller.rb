class TeamMembersController < ApplicationController

  def index
    @teams = Team.all
    @team_members = TeamMember.all
  end

  def show
  end

  def destroy
    @team_member = TeamMember.find(params[:id])
   if
    @team_member.destroy
    redirect_to teams_path, notice: '退出しました' and return
   else
    render teams_path, notice: 'error' and return
   end
  end

end
