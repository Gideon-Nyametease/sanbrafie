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
        format.html { redirect_to root_path, notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    @trip_params = Tour.new(tour_params)
    @trip = Tour.where("id=? AND active_status = true AND del_status=false",params[:id]).order(created_at: :desc).first
    if  @trip_params.valid?
      @new_trip_params = Tour.new(title: tour_params[:title], 
                                  price: tour_params[:price], 
                                  currency: tour_params[:currency], 
                                  description: tour_params[:description], 
                                  start_date: tour_params[:start_date], 
                                  end_date: tour_params[:end_date], 
                                  image: tour_params[:image],
                                  tour_id: @trip.tour_id)
      @new_package_info.save(validate: false)

      Tour.update_last_but_one('package_offering','package_sub_assigned_id',@info.assigned_id)

      flash[:notice] = 'Edit Successful!'
      redirect_to root_path
    else
      @title = tour_param[:title]
      @price = tour_param[:price]
      @currency = tour_param[:currency]
      @description = tour_param[:description]
      @start_date = tour_param[:start_date]
      @end_date = tour_param[:end_date]
      @start = tour_param[:active_start_date]
      @image = tour_param[:image]
      @tour_id = tour_param[:tour_id]

      @tour.update(tour_param)
      logger.info "ERRORS == #{@trip_params.errors.messages.inspect}"
      render 'edit'
    end






    # respond_to do |format|
    #   if @tour.update(tour_params)
    #     format.html { redirect_to root_path, notice: "Trip was successfully updated." }
    #     format.json { render :show, status: :ok, location: @tour }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @tour.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tours/1 or /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: "Trip was successfully destroyed." }
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
      params.require(:tour).permit(:tour_id, :title, :price, :currency, :stripe_product_id, :stripe_price_id, :description, :start_date, :end_date, :image, :sales_count)
    end
end
