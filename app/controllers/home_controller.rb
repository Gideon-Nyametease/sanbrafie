class HomeController < ApplicationController
    before_action :authenticate_user!, :except => [:landing_page,:booking_form, :create_booking]
    def landing_page
      if user_signed_in?
        if current_user.role_code == "client"
          @tours = Tour.limit(5)
          @booking_infos = BookingInfo.where("user_id = ?", current_user.id)
          @booking_infos = @booking_infos.present? ? @booking_infos : BookingInfo.where("(surname = ? AND othernames = ?) OR user_uid = ?",current_user.surname,current_user.othernames,current_user.uid)
        else
          @tours = Tour.limit(5)
          @booking_infos = BookingInfo.all
        end
      else
        @tours = Tour.limit(5)
        logger.info "THE TOURS = #{@tours.inspect}"
        @customer_msg = CustomerMsg.new
      end
      @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
      @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]
    end

    def booking_details
      @tours = Tour.all
    end

    def booking_form
        @tours = Tour.all
        @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
        @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]
        @purpose_statement = [["Cultural visit","Cultural visit"],["Potential business","Potential business"],["Shopping","Shopping"],["Honeymoon","Honeymoon"]]
    end

    def create_booking
        @booking_form_data = BookingInfo.new(booking_form_params)

        respond_to do |format|
          if @booking_form_data.valid?
            @booking_form_data =  BookingInfo.new(surname: booking_form_params[:surname],
            othernames: booking_form_params[:othernames],
            tour_id: booking_form_params[:tour_id],
            phone_number: booking_form_params[:phone_number],
            email: booking_form_params[:email],
            coordination_preference: booking_form_params[:coordination_preference],
            group_count: booking_form_params[:group_count],
            hotel_type: booking_form_params[:hotel_type],
            tour_duration: booking_form_params[:tour_duration],
            purpose_statement: "#{booking_form_params[:purpose_statement]}" + "  -  " +"#{booking_form_params[:comment]}")
            logger.info "Booking Info from form = #{@booking_form_data.inspect}"
            @booking_form_data.save(validate: false)
            BookingInfoMailer.with(booking_info: @booking_form_data).new_booking_info_email.deliver_later
            format.html { redirect_to root_path, notice: "Booking info was successfully created." }
            format.json { render :landing_page, status: :created, location: root_path }
          else
            logger.info "THE BOOKING ERROR = #{@booking_form_data.errors.message}"
            format.html { render :booking_form, status: :unprocessable_entity }
            format.json { render json: @booking_form_data.errors, status: :unprocessable_entity }
          end
        end
    end

    def create_msg
      @customer_msg = CustomerMsg.new(customer_msg_params)

      respond_to do |format|
        if @customer_msg.save
          format.html { redirect_to @customer_msg, notice: "Customer msg was successfully created." }
          format.json { render :show, status: :created, location: @customer_msg }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @customer_msg.errors, status: :unprocessable_entity }
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
