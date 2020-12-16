class RequestsController < ApplicationController

 def new
 end

 def index
 end

 def show
   @team = Team.find(params[:team_id])
   @teams = Request.where(status: 'approved').where(status: 'waiting')
   @team_members = TeamMember.all
 end

 def create
    @team = Team.find(params[:team_id])
    @request = current_user.requests.new(team: @team, status: 'waiting' )

    if @request.save
      redirect_to teams_path, notice: 'リクエストを送りました'
    else
      redirect_to teams_path, notice: 'リクエストに失敗しました'
    end
 end

 def destroy
    @team = Team.find(params[:team_id])
    @request = current_user.requests.find_by(user_id: current_user.id)
    @request.destroy
    redirect_to teams_path, notice: 'リクエストを取り消しました'
 end

end
