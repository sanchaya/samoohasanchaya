class DliBooksController < ApplicationController
  def index
    @os_translated_authors_count = AuthorTranslation.count
    @os_translated_publishers_count = PublisherTranslation.count
    @os_translated_books_count = BookTranslation.count
    @os_reviewed_books_count = BookTranslation.where(reviewed: true).count

    @translated_authors_count = DliAuthorTranslation.count
    @translated_publishers_count = DliPublisherTranslation.count
    @translated_books_count = DliBookTranslation.count
    @reviewed_books_count = DliBookTranslation.where(reviewed: true).count
    # Clean the below code
    # Use DRY
    # Move logics to Model
    # Use single query to fetch untranslated
    translated_books = DliBookTranslation.pluck('book_id')
    @books = DliBook.where("id not in (?)", translated_books.blank? ? [0] : translated_books ).order('RAND()')
    @book = @books.first
    @translate_book = @book.book_translations.new if @book

    translated_publishers = DliPublisherTranslation.pluck('publisher_id')
    @publishers = DliPublisher.where("id not in (?)", translated_publishers.blank? ? [0] : translated_publishers ).order('RAND()')
    @publisher = @publishers.first
    @translate_publisher = @publisher.publisher_translations.new if @publisher

    translated_authors = DliAuthorTranslation.pluck('author_id')
    @authors = DliAuthor.where("id not in (?)", translated_authors.blank? ? [0] : translated_authors ).order('RAND()')
    @author = @authors.first
    @translate_author = @author.author_translations.new if @author
  end
end
