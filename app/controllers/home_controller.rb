class HomeController < ApplicationController
    before_action :authenticate_user!, :except => [:landing_page,:booking_form,:privacy_policy, :booking_form2, :booking_details, :create_booking, :custom_trip_form, :create_custom_trip, :tos, :testimonial_form] # :checkout_page,
    def landing_page
      if user_signed_in?
        if current_user.role_code == "client"
          @tours = Tour.where(active_status: true, del_status: false).order(start_date: :asc).limit(5)
          booking_infos = BookingInfo.where("user_id = ?", current_user.id)
          @pagy, @booking_infos = booking_infos.present? ? pagy(BookingInfo.where("user_id = ?", current_user.id).order(created_at: :desc) ) : pagy(BookingInfo.where("surname = ? AND othernames = ? AND email = ?",current_user.surname,current_user.othernames,current_user.email).order(created_at: :desc) )
        else
          @tours = Tour.where(active_status: true, del_status: false).order(start_date: :asc).limit(5)
          @pagy, @booking_infos = pagy(BookingInfo.all.order(created_at: :desc) )
        end
      else
        @tours = Tour.where(active_status: true, del_status: false).order(start_date: :asc).limit(5)
        logger.info "THE TOURS = #{@tours.inspect}"
        @customer_msg = CustomerMsg.new
      end
      @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
      @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]
    end

    def upcoming_trips_modal
      @tours = Tour.where(active_status: true, del_status: false).order(start_date: :desc)
    end

    def checkout_page
      @tours = Tour.where('id = ?',params[:tour_id])[0]
      @booking = BookingInfo.where("tour_id=?",params[:tour_id])[0]
      @count = @booking.group_count
      logger.info "The booking form \n #{params[:tour_id].inspect}"
    end

    def booking_form
      @tours = Tour.where(active_status: true, del_status: false).order(title: :asc)
      @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
      @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]
      @purpose_statement = [["Cultural visit","Cultural visit"],["Potential business","Potential business"],["Shopping","Shopping"],["Honeymoon","Honeymoon"]]
    end

    def booking_details
      @tour = Tour.where("title = ?", params[:title])[0]
      logger.info"\n tour deets #{@tour.inspect}"
    end

    def testimonial_form
      @tours = Tour.where(active_status: true, del_status: false).order(title: :asc)
    end

    def create_testimonial
      @user_testimonial = UserTestimonial.new(booking_form_params)

      respond_to do |format|
        if @user_testimonial.valid?
          @user_testimonial =  UserTestimonial.new(fullname: booking_form_params[:fullname],
                                              testimonial: booking_form_params[:testimonial],
                                              tour_id: booking_form_params[:tour_title])
                                              logger.info "Testimonial form = #{@user_testimonial.inspect}"
          @user_testimonial.save(validate: false)
          format.html { redirect_to root_path, notice: "Your testimonial was successfully submitted" }
          format.json { render :show, status: :created, location: @user_testimonial }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user_testimonial.errors, status: :unprocessable_entity }
        end
      end
    end

    def custom_trip_form
      @tours = Tour.all
      @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
      @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]
      @purpose_statement = [["Cultural visit","Cultural visit"],["Potential business","Potential business"],["Shopping","Shopping"],["Honeymoon","Honeymoon"]]
    end

    def tos
    end

    def privacy_policy
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
            purpose_statement: "#{booking_form_params[:purpose_statement]}" + "  -  " +"#{booking_form_params[:comment]}",
            tos_agreement: booking_form_params[:tos_agreement])
            logger.info "Booking Info from form = #{@booking_form_data.inspect}"
            @booking_form_data.save(validate: false)
            BookingInfoMailer.with(booking_info: @booking_form_data).new_booking_info_email.deliver_later
            format.html { redirect_to checkout_page_path(tour_id: @booking_form_data.tour_id, booking_id:  @booking_form_data.id, count: @booking_form_data.group_count), notice: "Booking info was successfully created." }
            format.json { render :landing_page, status: :created, location: root_path }
          else
            logger.info "THE BOOKING ERROR = #{@booking_form_data.errors.messages}"
            format.js  render 'booking_form'
            format.json { render json: @booking_form_data.errors, status: :unprocessable_entity }
          end
        end
    end

    def success_page

    end

    def create_custom_trip
      @booking_form_data = CustomTrip.new(booking_form_params)

      respond_to do |format|
        if @booking_form_data.valid?
          @booking_form_data =  CustomTrip.new(surname: booking_form_params[:surname],
          othernames: booking_form_params[:othernames],
          destination: booking_form_params[:destination],
          phone_number: booking_form_params[:phone_number],
          email: booking_form_params[:email],
          coordination_preference: booking_form_params[:coordination_preference],
          group_count: booking_form_params[:group_count],
          hotel_type: booking_form_params[:hotel_type],
          trip_duration: booking_form_params[:trip_duration],
          purpose_statement: booking_form_params[:purpose_statement],
          comment: booking_form_params[:comment],
          tos_agreement: booking_form_params[:tos_agreement])
          logger.info "Booking Info from form = #{@booking_form_data.inspect}"
          @booking_form_data.save(validate: false)
          BookingInfoMailer.with(booking_info: @booking_form_data, marker: "custom").new_booking_info_email.deliver_later
          
          flash.now[:notice]="Your customized trip request was created successfully, we will reachout to you on the email you provided"
          format.html { redirect_to root_path, notice: "Your customized trip request was created successfully, we will reachout to you on the email you provided" }
          format.json { render :landing_page, status: :created, location: root_path }
        else
          logger.info "THE BOOKING ERROR = #{@booking_form_data.errors.messages}"
          format.js  render 'custom_trip'
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
      @tours = Tour.limit(5)
      logger.info "THE TOURS = #{@tours.inspect}"
      @coordination_preference = [["Air and Ground","AG"],["Ground only","G"]]
      @hotel_type = [["5 Star","5 Star"],["4 Star","4 Star"],["3 Star","3 Star"]]

      @customer_msg = CustomerMsg.new
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
        params.require(:booking_form).permit(:tos_agreement ,:destination, :trip_duration, :comment, :tour_id, :surname, :othernames, :full_name, :phone_number, :email, :coordination_preference, :group_count, :hotel_type, :tour_duration, :purpose_statement)
    end
end
