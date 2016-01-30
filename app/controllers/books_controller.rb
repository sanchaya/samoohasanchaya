class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update]
  # GET /books
  # GET /books.json
  def index
    reviewed =  BookReview.pluck('book_id') 
    search_ids = BookTranslation.where("book_title like '%#{params[:search]}' ").pluck('book_id')
    list_books = Book.includes(:book_description).includes(:author).includes(:publisher).includes(:book_translations).where("id not in (?) and id in (?)",reviewed.blank? ? [0] : reviewed, search_ids)
    @list_books = list_books.paginate(:page => params[:page])
    translated = BookTranslation.pluck('book_id')
    untranslated_books = Book.where("id not in (?)", translated.blank? ? [0] : translated )
    @books = untranslated_books.paginate(:page => params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @traslated = @book.book_translations.last 
    @description = @book.book_description
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @traslated = @book.book_translations.last ? @book.book_translations.last : @book
    @description = @book.book_description
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    @book.book_translations.first.update_attribute('book_title',params[:book])
    @book.author.author_translations.first.update_attribute('name',params[:author])
    @book.publisher.publisher_translations.first.update_attribute('name',params[:publisher])
    BookReview.create(book_id: @book.id)
    @description = @book.book_description
    @description.update_attributes(others: params[:others], date_issued: params[:year], rights: params[:rights])
    redirect_to book_path(@book)
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search
    @books = Book.search_books(params[:search])
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { render json: @books }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_translation_params
      params.require(:translation).permit(:author, :book_title, :publisher)
    end
  end
