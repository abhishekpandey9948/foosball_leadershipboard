class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :set_match_from_parameters, only: [:create]
  before_action :validate_match_parameters, only: [:create]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    respond_to do |format|
      unless @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
    # render json: ::Services::MatchService.new.create_match(params['match'])
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def validate_match_parameters
      @match.errors.add(:match, "Name not be blank") if @match.name.blank?
      @match.errors.add(:match, "Team1 not be blank") if @match.team1_id.blank?
      @match.errors.add(:match, "Team2 not be blank") if @match.team2_id.blank?
      @match.errors.add(:match, "Teams must be different") if @match.team1_id == @match.team2_id
      @match.errors.add(:match, "Players must be unique") if (@match.team1.players & @match.team2.players).present?
      @match.errors.add(:match, "Invalid scores") if (@match.team1_score.blank? or @match.team2_score.blank? or @match.team1_score.to_i == 0 or @match.team2_score.to_i == 0 or @match.team1_score.to_i == @match.team2_score.to_i)
      return render json: @match.errors, status: :unprocessable_entity if @match.errors.present?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:team1_id, :team2_id, :team1_winner, :name, :team1_score, :team2_score)
    end

    def set_match_from_parameters
      @match = Match.new(match_params)
    end
end
