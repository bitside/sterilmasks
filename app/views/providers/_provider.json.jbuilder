json.extract! provider, :id, :name, :description, :phone, :email, :street, :postal_code, :city, :created_at, :updated_at
json.url provider_url(provider, format: :json)
