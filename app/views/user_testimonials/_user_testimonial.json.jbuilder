json.extract! user_testimonial, :id, :fullname, :trip, :testimonial, :created_at, :updated_at
json.url user_testimonial_url(user_testimonial, format: :json)
