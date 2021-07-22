json.extract! customer_msg, :id, :email, :surname, :othernames, :message, :user_id, :status, :created_at, :updated_at
json.url customer_msg_url(customer_msg, format: :json)
