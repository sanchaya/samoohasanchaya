class FuelWordsController < ApplicationController

  def index
    # Raw code used which bad smell, make it dynamic and clean
    @os_translated_books_count = BookTranslation.count
    @os_reviewed_books_count = BookTranslation.where(reviewed: true).count
    @translated_books_count = DliBookTranslation.count
    @reviewed_books_count = DliBookTranslation.where(reviewed: true).count
    @word = FuelWord.not_translated
    @module = @word.fuel_module if @word
    @word_translates =  @word.fuel_translations if @word
    @word_translate = @word.fuel_translations.new if @word
  end

end
