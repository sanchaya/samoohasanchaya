class Language < ActiveRecord::Base
  has_many :books
  has_many :book_translations

  scope :kannada,  -> { where(language_code: 'kn').first }
end
