class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show edit update destroy ]

  # GET /tours or /tours.json
  def index
    @tours = Tour.all
  end

  def book_form
    @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
    @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]
    @purpose_statement = [["Cultural visit","Cultural visit"],["Potential business","Potential business"],["Shopping","Shopping"],["Honeymoon","Honeymoon"]]

  end

  # GET /tours/1 or /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours or /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: "Tour was successfully created." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: "Tour was successfully updated." }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1 or /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: "Tour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tour_params
      params.require(:tour).permit(:tour_id, :title, :description, :start_date, :end_date, :image)
    end
end
