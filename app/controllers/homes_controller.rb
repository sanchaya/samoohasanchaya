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
    @books = Book.where("id not in (?)", translated_books.blank? ? [0] : translated_books ).order('RAND()')
    @book = @books.first
    @translate_book = @book.book_translations.new

    translated_publishers = PublisherTranslation.pluck('publisher_id')
    @publishers = Publisher.where("id not in (?)", translated_publishers.blank? ? [0] : translated_publishers ).order('RAND()')
    @publisher = @publishers.first
    @translate_publisher = @publisher.publisher_translations.new

    translated_authors = AuthorTranslation.pluck('author_id')
    @authors = Author.where("id not in (?)", translated_authors.blank? ? [0] : translated_authors ).order('RAND()')
    @author = @authors.first
    @translate_author = @author.author_translations.new if @author
end


def about_us
end

end
