class PlayerController < ActionController::Base

  def index
    
  end

  def new
    @player = Player.new
  end

  def create
    render json: ::Services::PlayerService.new.create_player(params['player'])
  end


end
