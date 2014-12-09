class Language < ActiveRecord::Base
  has_many :books
  has_many :book_translations
end
