class BookingInfoMailer < ApplicationMailer
    def new_booking_info_email
        @booking_info = params[:booking_info]
    
        mail(to: <ADMIN_EMAIL>, subject: "Your trip has been booked!")
    end
end
