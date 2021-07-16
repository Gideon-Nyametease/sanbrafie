class HomeController < ApplicationController
    before_action :authenticate_user!, :except => [:landing_page,:booking_form]
    def landing_page
    end

    def booking_form
        @tours = Tour.all
    end

    def user_dashboard
    end

    def admin_dashboard
    end

    def profile
    end

    def trips_page
    end

    def media_page
    end
end
