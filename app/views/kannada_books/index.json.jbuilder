json.array!(@kannada_books) do |kannada_book|
  json.extract! kannada_book, :id, :name, :author, :publisher, :library, :book_link
  json.url kannada_book_url(kannada_book, format: :json)
end
