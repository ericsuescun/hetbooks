json.extract! book, :id, :title, :description, :discipline, :topic, :specialty, :speciality2, :price, :edition, :pub_year, :isbn_10, :isbn_13, :pages, :size, :cover, :volumes, :index, :created_at, :updated_at
json.url book_url(book, format: :json)
