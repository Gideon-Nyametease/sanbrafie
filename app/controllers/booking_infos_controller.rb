class BookingInfosController < ApplicationController
  before_action :set_booking_info, only: %i[ show edit update destroy ]

  # GET /booking_infos or /booking_infos.json
  def index
    @booking_infos = BookingInfo.all
  end

  def payment_form

  end

  def book_form
  end

  # GET /booking_infos/1 or /booking_infos/1.json
  def show
  end

  # GET /booking_infos/new
  def new
    @booking_info = BookingInfo.new
  end

  # GET /booking_infos/1/edit
  def edit
  end

  # POST /booking_infos or /booking_infos.json
  def create
    @booking_info = BookingInfo.new(booking_info_params)

    respond_to do |format|
      if @booking_info.save
        BookingInfo.with(booking_info: @booking_info).new_booking_info_email.deliver_later
        format.html { redirect_to @booking_info, notice: "Booking info was successfully created." }
        format.json { render :show, status: :created, location: @booking_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_infos/1 or /booking_infos/1.json
  def update
    respond_to do |format|
      if @booking_info.update(booking_info_params)
        format.html { redirect_to @booking_info, notice: "Booking info was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_infos/1 or /booking_infos/1.json
  def destroy
    @booking_info.destroy
    respond_to do |format|
      format.html { redirect_to booking_infos_url, notice: "Booking info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_info
      @booking_info = BookingInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_info_params
      params.require(:booking_info).permit(:surname, :othernames, :phone_number, :coordination_preference, :group_count, :hotel_type, :tour_duration, :purpose_statement, :user_id, :user_uid)
    end
end
