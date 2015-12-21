class WikiBooksController < ApplicationController

  def index
    @books = WikiBook.book_full_info
    respond_to do |format|
      format.json { render json: @books }
    end
  end

end
