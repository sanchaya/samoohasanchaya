class DliBooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update]

  def index
  end


  def show
    find_book
  end

  def edit
    find_book
  end


  def update
    find_book
    @book.book_translations.first.update_attribute('book_title',params[:book])
    DliBookReview.create(dli_book_id: @book.id)
    @description.update_attributes(others: params[:others], year: params[:year], rights: params[:rights])
    redirect_to dli_book_path(@book)
  end
  private

  def find_book
    @book = DliBook.find(params[:id])
    @traslated = @book.book_translations.last
    @description = @book.book_description
  end

end
