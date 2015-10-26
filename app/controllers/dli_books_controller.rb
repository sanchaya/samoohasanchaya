class DliBooksController < ApplicationController
  def index
    @os_translated_books_count = BookTranslation.count
    @os_reviewed_books_count = BookTranslation.where(reviewed: true).count
    @translated_books_count = DliBookTranslation.count
    @reviewed_books_count = DliBookTranslation.where(reviewed: true).count
end
end
