class TeamController < ActionController::Base

  def index
    
  end

  def new
    @team = Team.new
  end

  def create
    render json: ::Services::TeamService.new.create_team(params['team'])
  end


end
