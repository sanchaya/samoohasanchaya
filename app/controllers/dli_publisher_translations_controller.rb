class DliPublisherTranslationsController < ApplicationController
  def create
    @publisher = DliPublisher.find(params['dli_publisher_id'])
    @translate = @publisher.publisher_translations.new(publisher_translation_params)
    @translate.language_id = Language.kannada.id
    respond_to do |format|
      if @translate.save
        format.html { redirect_to root_path, notice: 'ಪ್ರಕಾಶಕರ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.' }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html { render :new }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end 

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_translation_params
      params.require(:dli_publisher_translation).permit(:name)
    end
  end
