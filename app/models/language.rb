class Language < ActiveRecord::Base
  has_many :books
  has_many :book_translations
  has_many :fuel_translations
  has_many :fuel_words

  scope :kannada,  -> { where(language_code: 'kn').first }
end
