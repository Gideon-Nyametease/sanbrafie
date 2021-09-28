class CheckoutController < ApplicationController
    before_action :authenticate_user!, :except => [:create]
    skip_before_action :verify_authenticity_token
    def create
        @tour = Tour.find(params[:id])
        count_str = params[:count]
        count = count_str.to_i

        logger.info"\n Tour price = #{@tour.price.inspect}\n"
        if @tour.stripe_price_id
            logger.info"\n Tour price stripe price id = #{@tour.stripe_price_id.inspect}\n"
            @session = Stripe::Checkout::Session.create({
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            line_items: [{
                price: @tour.stripe_price_id,
                quantity: count
            }],
            mode: 'payment',
            # success_url: "http://localhost:3000/success_page?tour_id=#{@tour.id}",
            # cancel_url: "http://localhost:3000/checkout_page?tour_id=#{@tour.id}"
            success_url: "https://www.sanbrafiegroup.com/success_page?tour_id=#{@tour.id}",
            cancel_url: "https://www.sanbrafiegroup.com/checkout_page?tour_id=#{@tour.id}"
            })
        else
            @session = Stripe::Checkout::Session.create({
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            line_items: [{
                name: @tour.title,
                amount: @tour.price,
                currency: @tour.currency,
                quantity: count
            }],
            mode: 'payment',
            # success_url: "http://localhost:3000/success_page?tour_id=#{@tour.id}",
            # cancel_url: "http://localhost:3000/checkout_page?tour_id=#{@tour.id}"
            success_url: "https://www.sanbrafiegroup.com/success_page?tour_id=#{@tour.id}",
            cancel_url: "https://www.sanbrafiegroup.com/checkout_page?tour_id=#{@tour.id}"
            })
        end

        respond_to do |format|
            format.js
        end
    end
end
