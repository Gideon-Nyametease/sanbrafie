class WebhooksController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
  
    def create
      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil
  
      begin
        event = Stripe::Webhook.construct_event(
          # payload, sig_header, Rails.application.credentials[:stripe][:live][:webhook]
          payload, sig_header, Rails.application.credentials[:stripe][:test][:webhook]
        )
      rescue JSON::ParserError => e
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "Signature error"
        p e
        return
      end
  
      # Handle the event
      case event.type
      when 'checkout.session.completed'
        session = event.data.object
        session_with_expand = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ["line_items"]})
        session_with_expand.line_items.data.each do |line_item|
          product = Tour.find_by(stripe_product_id: line_item.price.product)
          product.increment!(:sales_count)
          booking_info = BookingInfo.find_by(tour_id: product.id)
          booking_info.payment_status = truess
          # @tour = Tour.find_by(price: session.amount_total)
          # @tour.increment!(:sales_count)
          logger.info"\nWebhooks works\n"
        end
      end
  
      render json: { message: 'success' }
    end
  end