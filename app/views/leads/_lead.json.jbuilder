json.extract! lead, :id, :firstname, :lastname, :company, :email, :phone, :created_at, :updated_at
json.url lead_url(lead, format: :json)
