class CustomTripsController < ApplicationController
  before_action :set_custom_trip, only: %i[ show edit update destroy ]

  # GET /custom_trips or /custom_trips.json
  def index
    @custom_trips = CustomTrip.all
  end

  # GET /custom_trips/1 or /custom_trips/1.json
  def show
  end

  # GET /custom_trips/new
  def new
    @custom_trip = CustomTrip.new
  end

  # GET /custom_trips/1/edit
  def edit
  end

  # POST /custom_trips or /custom_trips.json
  def create
    @custom_trip = CustomTrip.new(custom_trip_params)

    respond_to do |format|
      if @custom_trip.save
        format.html { redirect_to @custom_trip, notice: "Custom trip was successfully created." }
        format.json { render :show, status: :created, location: @custom_trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @custom_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_trips/1 or /custom_trips/1.json
  def update
    respond_to do |format|
      if @custom_trip.update(custom_trip_params)
        format.html { redirect_to @custom_trip, notice: "Custom trip was successfully updated." }
        format.json { render :show, status: :ok, location: @custom_trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @custom_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_trips/1 or /custom_trips/1.json
  def destroy
    @custom_trip.destroy
    respond_to do |format|
      format.html { redirect_to custom_trips_url, notice: "Custom trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_trip
      @custom_trip = CustomTrip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def custom_trip_params
      params.require(:custom_trip).permit(:destination, :surname, :othernames, :email, :phone_number, :coordination_preference, :group_count, :hotel_type, :trip_duration, :purpose_statement, :comment)
    end
end
