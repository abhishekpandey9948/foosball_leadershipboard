class PlayerController < ActionController::Base

  def new
    @player = Player.new
  end

  def create
    render json: ::Services::PlayerService.new.create_player(params['player'])
  end

  def show
    @players = ::Services::PlayerService.show_players(params[:page])
  end

end
