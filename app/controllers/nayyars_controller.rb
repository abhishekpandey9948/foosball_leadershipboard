class NayyarsController < ApplicationController
  before_action :set_nayyar, only: [:show, :edit, :update, :destroy]

  # GET /nayyars
  # GET /nayyars.json
  def index
    @nayyars = Nayyar.all
  end

  # GET /nayyars/1
  # GET /nayyars/1.json
  def show
  end

  # GET /nayyars/new
  def new
    @nayyar = Nayyar.new
  end

  # GET /nayyars/1/edit
  def edit
  end

  # POST /nayyars
  # POST /nayyars.json
  def create
    @nayyar = Nayyar.new(nayyar_params)

    respond_to do |format|
      if @nayyar.save
        format.html { redirect_to @nayyar, notice: 'Nayyar was successfully created.' }
        format.json { render :show, status: :created, location: @nayyar }
      else
        format.html { render :new }
        format.json { render json: @nayyar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nayyars/1
  # PATCH/PUT /nayyars/1.json
  def update
    respond_to do |format|
      if @nayyar.update(nayyar_params)
        format.html { redirect_to @nayyar, notice: 'Nayyar was successfully updated.' }
        format.json { render :show, status: :ok, location: @nayyar }
      else
        format.html { render :edit }
        format.json { render json: @nayyar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nayyars/1
  # DELETE /nayyars/1.json
  def destroy
    @nayyar.destroy
    respond_to do |format|
      format.html { redirect_to nayyars_url, notice: 'Nayyar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nayyar
      @nayyar = Nayyar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nayyar_params
      params.require(:nayyar).permit(:name, :age)
    end
end
