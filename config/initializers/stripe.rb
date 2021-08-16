require 'stripe'
if Rails.application.credentials.stripe.present? && Rails.application.credentials.stripe[:secret_key].present?
    Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
end