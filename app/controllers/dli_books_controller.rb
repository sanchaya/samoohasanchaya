class DliBooksController < ApplicationController

  def index
    @list_books = DliBook.includes(:book_description).includes(:author).includes(:publisher).includes(:book_translations).paginate(:page => params[:page])
    render 'books/index'
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
    @book.author.author_translations.first.update_attribute('name',params[:author])
    @book.publisher.publisher_translations.first.update_attribute('name',params[:publisher])
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
