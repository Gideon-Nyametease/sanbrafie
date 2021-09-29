class BookingInfoMailer < ApplicationMailer
    def new_booking_info_email
        @booking_info = params[:booking_info]

        if params[:marker] == "custom"
            mail(to: ["sanbrafiegroupinc@gmail.com","kwame.tcu@gmail.com"], subject: "Somebody requested a customized trip!")
        else
            mail(to: ["sanbrafiegroupinc@gmail.com","kwame.tcu@gmail.com"], subject: "Somebody just booked a trip!")
        end       
        # sanbrafiegroupinc 
    end
end
