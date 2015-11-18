class FuelTranslation < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false

  belongs_to :fuel_word
  belongs_to :user
  belongs_to :language
  belongs_to :vote_translation
end
