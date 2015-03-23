class DliAuthorTranslationsController < ApplicationController
  def create
    @author = DliAuthor.find(params['dli_author_id'])
    @translate = @author.author_translations.new(author_translation_params)
    @translate.language_id = Language.kannada.id
    respond_to do |format|
      if @translate.save
        format.html { redirect_to root_path, notice: 'ಲೇಖಕರ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end 

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def author_translation_params
      params.require(:dli_author_translation).permit(:name)
    end
  end
