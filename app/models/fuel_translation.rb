class FuelTranslation < ActiveRecord::Base
  belongs_to :fuel_word
  belongs_to :user
  belongs_to :language
end
