json.extract! user, :id, :name, :lastname, :cel, :tel, :created_at, :updated_at
json.url user_url(user, format: :json)
