class TeamController < ActionController::Base

  def index
    
  end

  def new
    @team = Team.new
  end

  def create
    render json: ::Services::TeamService.new.create_team(params['team'])
  end

  #for leadership
  def show
    @teams = ::Services::TeamService.show_teams
  end


end
