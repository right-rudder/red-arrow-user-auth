class AircraftsController < ApplicationController
  before_action :set_aircraft, only: %i[ show edit update destroy ]
  before_action :check_permissions, except: %i[index show]

  # GET /aircrafts or /aircrafts.json
  def index
    @aircrafts = Aircraft.all
  end

  # GET /aircrafts/1 or /aircrafts/1.json
  def show
  end

  # GET /aircrafts/new
  def new
    @aircraft = Aircraft.new
  end

  # GET /aircrafts/1/edit
  def edit
  end

  # POST /aircrafts or /aircrafts.json
  def create
    @aircraft = Aircraft.new(aircraft_params)

    respond_to do |format|
      if @aircraft.save
        format.html { redirect_to aircraft_url(@aircraft), notice: "Aircraft was successfully created." }
        format.json { render :show, status: :created, location: @aircraft }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aircraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aircrafts/1 or /aircrafts/1.json
  def update
    respond_to do |format|
      if @aircraft.update(aircraft_params)
        format.html { redirect_to aircraft_url(@aircraft), notice: "Aircraft was successfully updated." }
        format.json { render :show, status: :ok, location: @aircraft }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aircraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aircrafts/1 or /aircrafts/1.json
  def destroy
    @aircraft.destroy!

    respond_to do |format|
      format.html { redirect_to aircrafts_url, notice: "Aircraft was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aircraft
      @aircraft = Aircraft.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aircraft_params
      params.require(:aircraft).permit(:name, :model, :tail_number, :string, :status, :string)
    end

      # Check if the user is an admin
    def check_permissions
      unless current_user.is_admin? || current_user.is_maintenance? 
        redirect_to aircrafts_path, alert: 'You do not have permission to perform this action.'
      end
    end
end
