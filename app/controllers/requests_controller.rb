class RequestsController < ApplicationController

  def new
  end

  def index
    # リクエストしたチームとユーザーの情報を持ってくる
    @requests = current_user.created_team.requests.where(status: 'waiting')
  end

  # 承認処理
  def update
    # リクエストテーブルからリクエストを取得
    @request = Request.find(params[:id])
    @request.update(status: 'approved')
    team = @request.team
    request_user = @request.user
    # チームメンバーに、情報をいれる準備
    team_member = @request.team.team_members.build(team: team,user: request_user)
    team_member.save
    redirect_to team_requests_path, notice: '申請を許可しました'
  end

  def show
    @team = Team.find(params[:team_id])
    @teams = Request.where(status: 'approved').where(status: 'waiting')
    @team_members = TeamMember.all
  end

  def create
    @team = Team.find(params[:team_id])
    @request = current_user.requests.new(team: @team, status: 'waiting')

    if @request.save
      redirect_to teams_path, notice: 'リクエストを送りました' and return
    else
      render teams_path, notice: 'リクエストに失敗しました' and return
    end
  end

  def destroy
    @request = Request.find(params[:id])

   if @request.approved?
    redirect_to teams_path, notice: 'リクエストは許可済みです' and return
   end

   @team = Team.find(@request.team_id)
   @owner = @team.user_id

   if @owner == current_user
    @request.destroy
    redirect_to team_requests_path, notice: 'リクエストを拒否しました' and return
   else
    @request.destroy
    redirect_to teams_path, notice: 'リクエストを取り消しました' and return
   end
  end
end
