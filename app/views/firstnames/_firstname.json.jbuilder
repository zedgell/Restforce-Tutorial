json.extract! firstname, :id, :lastname, :company, :email, :phone, :created_at, :updated_at
json.url firstname_url(firstname, format: :json)
