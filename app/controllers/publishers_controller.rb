class PublishersController < ApplicationController
  def index
    translated = PublisherTranslation.pluck('publisher_id')
    untranslated = Publisher.where("id not in (?)", translated.blank? ? [0] : translated )
    @publishers = untranslated.paginate(:page => params[:page])
  end
end
