class HomeController < ApplicationController
    before_action :authenticate_user!, :except => [:landing_page,:booking_form, :create_booking]
    def landing_page
      if user_signed_in?
        @booking_infos = BookingInfo.where("user_id = ?", current_user.id)
        @booking_infos = @booking_infos.present? ? @booking_infos : BookingInfo.where("(surname = ? AND othernames = ?) OR user_uid = ?",current_user.surname,current_user.othernames,current_user.uid)
      end
    end

    def booking_form
        @tours = Tour.all
    end

    def create_booking
        @booking_form_data = BookingInfo.new(booking_form_params)

        respond_to do |format|
          if @booking_form_data.save
            format.html { redirect_to root_path, notice: "Booking info was successfully created." }
            format.json { render :landing_page, status: :created, location: root_path }
          else
            logger.info "THE BOOKING ERROR = #{@booking_form_data.errors.message}"
            format.html { render :booking_form, status: :unprocessable_entity }
            format.json { render json: @booking_form_data.errors, status: :unprocessable_entity }
          end
        end
    end

    def user_dashboard
      @booking_infos = BookingInfo.where("user_id = ?", current_user.id)
      @booking_infos = @booking_infos.present? ? @booking_infos : BookingInfo.where("(surname = ? AND othername = ?) OR uid = ?",current_user.surname,current_user.othernames,current_user.uid)
    end

    def admin_dashboard
    end

    def profile
    end

    def trips_page
    end

    def media_page
    end

    # Only allow a list of trusted parameters through.
    def booking_form_params
        params.require(:booking_form).permit(:tour_id, :surname, :othernames, :phone_number, :email, :coordination_preference, :group_count, :hotel_type, :tour_duration, :purpose_statement)
    end
end
