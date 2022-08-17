json.extract! booking_type, :id, :name, :location, :description, :color, :duration, :payment_required, :price, :user_id, :created_at, :updated_at
json.url booking_type_url(booking_type, format: :json)
json.description booking_type.description.to_s
