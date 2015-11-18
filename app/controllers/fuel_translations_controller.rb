class FuelTranslationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @word = FuelWord.find(params[:fuel_word_id])
    @word_translate = @word.fuel_translations.new(fuel_translation_params)
    @word_translate.language_id = Language.kannada.id
    @word_translate.user_id = current_user.id
    respond_to do |format|
      if @word_translate.save
       @word = FuelWord.not_translated
       @module = @word.fuel_module if @word
       @word_translates =  @word.fuel_translations if @word
       @word_translate = @word.fuel_translations.new if @word
       format.html { redirect_to root_path, notice: 'Success' }
       format.js
     else
       format.html {  redirect_to root_path, notice: 'Failed' } 
       format.js
     end
   end

 end

 def vote_translation
  VoteTranslation.create_update_vote(current_user, params[:id], params[:fuel_word_id])
  render nothing: true
end

private

def fuel_translation_params
  params.require(:fuel_translation).permit(:name)
end

end
