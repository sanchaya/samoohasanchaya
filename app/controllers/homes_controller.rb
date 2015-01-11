class HomesController < ApplicationController
  def index
    @translated_authors_count = AuthorTranslation.count
    @translated_publishers_count = PublisherTranslation.count
    @translated_books_count = BookTranslation.count
    translated = BookTranslation.pluck('book_id')
    @book = Book.where("id not in (?)", translated.blank? ? [0] : translated ).first
    @translate = @book.book_translations.new
  end
end
