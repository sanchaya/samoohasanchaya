class BookTranslationsController < ApplicationController

  def create
    @book = Book.find(params['book_id'])
    @translation = @book.book_translations.new(book_translation_params)
    @translation.id = Translation.last.id
    respond_to do |format|
      if @translation.save
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_translation_params
      params.require(:book_translation).permit(:author, :book_title, :publisher)
    end
  end
