require 'stripe'
if Rails.application.credentials.stripe.present? && Rails.application.credentials.stripe[:test][:secret_key].present?
    Stripe.api_key = Rails.application.credentials.stripe[:test][:secret_key]
end