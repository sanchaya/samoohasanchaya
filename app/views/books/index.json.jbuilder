json.array!(@books) do |book|
  json.extract! book, :id, :author, :book_title, :publisher, :language_id
  json.url book_url(book, format: :json)
end
