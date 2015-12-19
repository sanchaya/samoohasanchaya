class DliBooksController < ApplicationController

  def show
    find_book
  end

  def edit
    find_book
  end


  def update
    find_book
    @description.update_attribute('others',params[:others])
    redirect_to dli_book_path(@book)
  end
  private

  def find_book
    @book = DliBook.find(params[:id])
    @traslated = @book.book_translations.last
    @description = @book.book_description
  end

end
