class FuelWord < ActiveRecord::Base
  has_many :fuel_translations
  belongs_to :fuel_module


  def self.not_translated
    translated = FuelTranslation.pluck('fuel_word_id').uniq
    FuelWord.where("id not in (?)", translated).order('RAND()').first
  end
end
