class MatchController < ActionController::Base

  def index

  end

  def new
    @match = Match.new
  end

  def create
    render json: ::Services::MatchService.new.create_match(params['match'])
  end


end
