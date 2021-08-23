class BookingInfoMailer < ApplicationMailer
    def new_booking_info_email
        @booking_info = params[:booking_info]

        if params[:marker] == "custom"
            mail(to: Rails.application.credentials.google[:gmail_username], subject: "Somebody requested a customized trip!")
        else
            mail(to: Rails.application.credentials.google[:gmail_username], subject: "Somebody just booked a trip!")
        end
        
        # mail(to: "sanbrafiegroupinc@gmail.com", subject: "Somebody just booked a trip!")
    end
end
