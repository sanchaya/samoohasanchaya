class HomesController < ApplicationController
  def index
    @translated_authors_count = AuthorTranslation.count
    @translated_publishers_count = PublisherTranslation.count
    @translated_books_count = BookTranslation.count
    # Clean the below code
    # Use DRY
    # Move logics to Model
    # Use single query to fetch untranslated
    translated_books = BookTranslation.pluck('book_id')
    @books = Book.where("id not in (?)", translated_books.blank? ? [0] : translated_books )
    @book = @books.first
    @translate_book = @book.book_translations.new

    translated_publishers = PublisherTranslation.pluck('publisher_id')
    @publishers = Publisher.where("id not in (?)", translated_publishers.blank? ? [0] : translated_publishers )
    @publisher = @publishers.first
    @translate_publisher = @publisher.publisher_translations.new

    translated_authors = AuthorTranslation.pluck('author_id')
    @authors = Author.where("id not in (?)", translated_authors.blank? ? [0] : translated_authors )
    @author = @authors.first
    @translate_author = @author.author_translations.new
  end
end
