json.extract! consumer, :id, :name, :description, :phone, :email, :street, :postal_code, :city, :created_at, :updated_at
json.url consumer_url(consumer, format: :json)
