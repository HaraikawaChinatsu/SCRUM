class TeamMemberController < ApplicationController

  def index
    @user =
    @teams = Team.all
    @team_members = TeamMember.all
  end

  def show
  end

end
