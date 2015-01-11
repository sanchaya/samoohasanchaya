class PublisherTranslationsController < ApplicationController
  def index
  end

  def new
    @publisher = Publisher.find(params['publisher_id'])
    @translate = @publisher.publisher_translations.new
  end

  def edit
  end

  def create
    @publisher = Publisher.find(params['publisher_id'])
    @translate = @publisher.publisher_translations.new(publisher_translation_params)
    @translate.language_id = Language.kannada.id
    respond_to do |format|
      if @translate.save
        format.html { redirect_to root_path, notice: 'Publisher was successfully translated.' }
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
      params.require(:publisher_translation).permit(:name)
    end
    
  end
