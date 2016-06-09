class KannadaBooksController < ApplicationController
  before_action :set_kannada_book, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!


  respond_to :html

  def index
    @kannada_books = KannadaBook.where(library: 'Dli').paginate(:page => params[:page])
    respond_with(@kannada_books)
  end

  def show
    respond_with(@kannada_book)
  end

  def new
    @kannada_book = KannadaBook.new
    respond_with(@kannada_book)
  end

  def edit
  end

  def create
    @kannada_book = KannadaBook.new(kannada_book_params)
    @kannada_book.save
    respond_with(@kannada_book)
  end

  def update
    @kannada_book.update(kannada_book_params)
    respond_with(@kannada_book)
  end

  def destroy
    @kannada_book.destroy
    respond_with(@kannada_book)
  end

  private
    def set_kannada_book
      @kannada_book = KannadaBook.find(params[:id])
    end

    def kannada_book_params
      params.require(:kannada_book).permit(:name, :author, :publisher)
    end
end
