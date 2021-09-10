class CheckoutController < ApplicationController
    before_action :authenticate_user!, :except => [:create]
    def create
        tour = Tour.find(params[:id])
        count_str = params[:count]
        count = count_str.to_i

        # logger.info"\n Tour price = #{params[:count]}\n"
        @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
            name: tour.title,
            amount: tour.price*100*count,
            currency: tour.currency,
            quantity: 1
        }],
        mode: 'payment',
        # success_url: 'http://localhost:3000/',
        # cancel_url: "http://localhost:3000/checkout_page?tour_id=#{tour.id}"
        success_url: 'https://sanbrafiegroup.org/',
        cancel_url: "https://sanbrafiegroup.org/"
        })

        respond_to do |format|
            format.js
        end
    end
end
