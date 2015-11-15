class FuelTranslationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @word = FuelWord.find(params[:fuel_word_id])
    @word_translate = @word.fuel_translations.new(fuel_translation_params)
    @word_translate.language_id = Language.kannada.id
    @word_translate.user_id = current_user.id
    if @word_translate.save
     redirect_to root_path, notice: 'ಪುಸ್ತಕದ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.'
   else
    redirect_to root_path, notice: 'Failed'
  end
end

private

def fuel_translation_params
  params.require(:fuel_translation).permit(:name)
end

end
