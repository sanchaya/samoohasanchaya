class DliBookTranslationsController < ApplicationController
  before_action :authenticate_user!, except: [ :new, :create]
  def index
    @translated_books = DliBookTranslation.where("reviewed is null or reviewed = false").order('RAND()')
    @reviewed_count = @translated_books.count
    @unreviewed_count = DliBookTranslation.count - @reviewed_count
    @os_translated_books_count = BookTranslation.count
    @os_reviewed_books_count = BookTranslation.where(reviewed: true).count
    @translated_books_count = DliBookTranslation.count
    @reviewed_books_count = DliBookTranslation.where(reviewed: true).count
    @translate = @translated_books.first
    if @translate
     @book = @translate.book
     @author = @book.author.author_translations.first ? @book.author.author_translations.first : @book.author 
     @publisher = @book.publisher.publisher_translations.first ? @book.publisher.publisher_translations.first : @book.publisher
   end
 end


 def create
  @book = DliBook.find(params['dli_book_id'])
  @translate = @book.book_translations.new(book_translation_params)
  @translate.language_id = Language.kannada.id
  respond_to do |format|
    if @translate.save
      format.html { redirect_to root_path, notice: 'ಪುಸ್ತಕದ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.' }
      format.json { render :show, status: :ok, location: @book }
    else
      format.html { render :new }
      format.json { render json: @book.errors, status: :unprocessable_entity }
    end
  end
end

def update
  @book = DliBook.find(params['dli_book_id'])
  @translate = @book.book_translations.find(params[:id])
  @translate.reviewed = true
  @translate.user_id = current_user.id
  respond_to do |format|
    if @translate.update_attributes(book_translation_params)
      save_author_publisher
      format.html { redirect_to dli_book_translations_path, notice: 'ಪುಸ್ತಕದ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.' }
    else
      format.html { render :edit }
    end
  end
end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_translation_params
      params.require(:dli_book_translation).permit(:book_title)
    end

    def save_author_publisher
      @author = @book.author.author_translations.first ? @book.author.author_translations.first : @book.author.author_translations.new 
      @publisher = @book.publisher.publisher_translations.first ? @book.publisher.publisher_translations.first : @book.publisher.publisher_translations.new
      @author.name = params[:author]
      @author.save
      @publisher.name = params[:publisher]
      @publisher.save
    end

  end
