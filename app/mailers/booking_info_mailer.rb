class BookingInfoMailer < ApplicationMailer
    def new_booking_info_email
        @booking_info = params[:booking_info]
    
        mail(to: "kwame.tcu@gmail.com", subject: "Your trip has been booked!")
    end
end
