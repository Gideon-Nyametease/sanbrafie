require "cloudinary"

Cloudinary.config do |config|
  config.cloud_name = 'sanbrafiegroup'
  config.api_key = Rails.application.credentials.cloudinary[:api_key]
  config.api_secret = Rails.application.credentials.cloudinary[:api_secret]
  config.secure = true
  config.cdn_subdomain = true


end
