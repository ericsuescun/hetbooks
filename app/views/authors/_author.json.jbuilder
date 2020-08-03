json.extract! author, :id, :name, :lastname, :university, :job_title, :company, :created_at, :updated_at
json.url author_url(author, format: :json)
