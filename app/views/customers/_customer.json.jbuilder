json.extract! customer, :id, :user_id, :fullname, :cel, :tel, :address, :city, :email, :prof_title, :specialty, :specialty2, :created_at, :updated_at
json.url customer_url(customer, format: :json)
