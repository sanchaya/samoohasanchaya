class HomesController < ApplicationController
  def index
    @translated_authors_count = AuthorTranslation.count
    @translated_publishers_count = PublisherTranslation.count
    @translated_books_count = BookTranslation.count
  end
end
