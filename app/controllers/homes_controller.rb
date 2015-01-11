class HomesController < ApplicationController
  def index
    @translated_authors_count = AuthorTranslation.count
    @translated_publishers_count = PublisherTranslation.count
    @translated_books_count = BookTranslation.count

    translated_books = BookTranslation.pluck('book_id')
    @book = Book.where("id not in (?)", translated_books.blank? ? [0] : translated_books ).first
    @translate_book = @book.book_translations.new

    translated_publishers = PublisherTranslation.pluck('publisher_id')
    @publisher = Publisher.where("id not in (?)", translated_publishers.blank? ? [0] : translated_publishers ).first
    @translate_publisher = @publisher.publisher_translations.new

    translated_authors = AuthorTranslation.pluck('author_id')
    @author = Author.where("id not in (?)", translated_authors.blank? ? [0] : translated_authors ).first
    @translate_author = @author.author_translations.new
  end
end
