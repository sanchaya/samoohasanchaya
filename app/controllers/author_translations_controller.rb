class AuthorTranslationsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @author = Author.find(params['author_id'])
    @translate = @author.author_translations.new
  end

  def edit
  end

  def create
    @author = Author.find(params['author_id'])
    @translate = @author.author_translations.new(author_translation_params)
    @translate.language_id = Language.kannada.id
    respond_to do |format|
      if @translate.save
        format.html { redirect_to authors_path, notice: 'Author was successfully translated.' }
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
      params.require(:author_translation).permit(:name)
    end

  end
