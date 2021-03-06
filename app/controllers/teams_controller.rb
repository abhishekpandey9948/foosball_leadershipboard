class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_team_from_parameters, only: [:create]
  before_action :validate_team_parameters, only: [:create]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order('score desc').limit(10)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    # @teams = ::Services::TeamService.show_teams
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    respond_to do |format|
      begin
        @team.save!
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      rescue => e
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def validate_team_parameters
      @team.errors.add(:team, "Name not be blank") if @team.name.blank?
      @team.errors.add(:team, "Player1 not be blank") if @team.player1_id.blank?
      @team.errors.add(:team, "Player2 not be blank") if @team.player2_id.blank?
      @team.errors.add(:team, "Players must be different") if @team.player1_id == @team.player2_id
      @team.errors.add(:team, "Already team exist for these players") if Team.find_team_by_players( @team.player1_id, @team.player2_id).present?
      return render json: @team.errors, status: :unprocessable_entity if @team.errors.present?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :player1_id, :player2_id, :score)
    end

    def set_team_from_parameters
      @team = Team.new(team_params)
    end
end
