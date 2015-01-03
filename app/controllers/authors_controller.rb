class AuthorsController < ApplicationController
  def index
    translated = AuthorTranslation.pluck('author_id')
    untranslated = Author.where("id not in (?)", translated.blank? ? [0] : translated )
    @authors = untranslated.paginate(:page => params[:page])
  end
end
