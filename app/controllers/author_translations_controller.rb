class AuthorTranslationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  def index
    translated_authors = AuthorTranslation
    @translated_authors = translated_authors.paginate(:page => params[:page], :per_page => 30)
  end

  def new
    @author = Author.find(params['author_id'])
    @translate = @author.author_translations.new
  end

  def edit
    @author = Author.find(params['author_id'])
    @translate = @author.author_translations.find(params[:id])
  end

  def create
    @author = Author.find(params['author_id'])
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

  def update
   @author = Author.find(params['author_id'])
   @translate = @author.author_translations.find(params[:id])
   respond_to do |format|
    if @translate.update_attributes(author_translation_params)
      format.html { redirect_to root_path, notice: 'ಲೇಖಕರ ಹೆಸರನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕನ್ನಡೀಕರಿಸಲಾಯ್ತು.' }
    else
      format.html { render :edit }
    end
  end
end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def author_translation_params
      params.require(:author_translation).permit(:name)
    end

  end
