class CheckoutController < ApplicationController
    before_action :authenticate_user!, :except => [:create]
    skip_before_action :verify_authenticity_token
    def create
        @tour = Tour.find(params[:id])
        count_str = params[:count]
        count = count_str.to_i

        logger.info"\n Tour price = #{count.inspect}\n"
        @session = Stripe::Checkout::Session.create({
        customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        line_items: [{
            name: @tour.title,
            amount: @tour.price*100*count,
            currency: @tour.currency,
            # price: @tour.stripe_price_id,
            quantity: 1
        }],
        mode: 'payment',
        # success_url: 'http://localhost:3000/',
        # cancel_url: "http://localhost:3000/checkout_page?tour_id=#{@tour.id}"
        success_url: "https://www.sanbrafiegroup.com/",
        cancel_url: "https://www.sanbrafiegroup.com/checkout_page?tour_id=#{@tour.id}"
        })

        respond_to do |format|
            format.js
        end
    end
end
