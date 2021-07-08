class HomeController < ApplicationController
    # before_action :authenticate_user!, :except => [:landing_page,:login_form]
    def landing_page
    end

    def login_form
    end

    def user_dashboard
    end

    def admin_dashboard
    end
end
