class BookingInfoMailer < ApplicationMailer
    def new_booking_info_email
        @booking_info = params[:booking_info]
    
        mail(to: Rails.application.credentials.google[:gmail_username], subject: "Somebody just booked a trip!")
    end
end
