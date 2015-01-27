class BookTranslationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  def index
    translated_books = BookTranslation
    @translated_books = translated_books.paginate(:page => params[:page], :per_page => 30)
  end

  def new
    @book = Book.find(params['book_id'])
    @translate = @book.book_translations.new
  end

  def edit
   @book = Book.find(params['book_id'])
   @translate = @book.book_translations.find(params[:id])
 end

 def show
  @book = BookTranslation.find(params[:id])
end

def create
  @book = Book.find(params['book_id'])
  @translate = @book.book_translations.new(book_translation_params)
  @translate.language_id = Language.kannada.id
  respond_to do |format|
    if @translate.save
      format.html { redirect_to root_path, notice: 'Book was successfully translated.' }
      format.json { render :show, status: :ok, location: @book }
    else
      format.html { render :new }
      format.json { render json: @book.errors, status: :unprocessable_entity }
    end
  end
end

def update
  @book = Book.find(params['book_id'])
  @translate = @book.book_translations.find(params[:id])
  respond_to do |format|
    if @translate.update_attributes(book_translation_params)
      format.html { redirect_to root_path, notice: 'Book was successfully translated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  @book = BookTranslation.find(params[:id])
  @book.destroy
  respond_to do |format|
    format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_translation_params
      params.require(:book_translation).permit(:book_title)
    end
  end
