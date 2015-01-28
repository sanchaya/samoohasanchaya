class PublisherTranslationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  def index
    translated_publishers = PublisherTranslation
    @translated_publishers = translated_publishers.paginate(:page => params[:page], :per_page => 30)
  end

  def new
    @publisher = Publisher.find(params['publisher_id'])
    @translate = @publisher.publisher_translations.new
  end

  def edit
    @publisher = Publisher.find(params['publisher_id'])
    @translate = @publisher.publisher_translations.find(params[:id])
  end

  def create
    @publisher = Publisher.find(params['publisher_id'])
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
  
  def update
    @publisher = Publisher.find(params['publisher_id'])
    @translate = @publisher.publisher_translations.find(params[:id])
    respond_to do |format|
      if @translate.update_attributes(publisher_translation_params)
        format.html { redirect_to root_path, notice: 'ಪ್ರಕಾಶಕರ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_translation_params
      params.require(:publisher_translation).permit(:name)
    end
    
  end
