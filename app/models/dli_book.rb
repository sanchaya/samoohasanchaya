class DliBook < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy, foreign_key: 'book_id', class_name: 'DliBookTranslation'
  has_one :book_description, dependent: :destroy, foreign_key: 'book_id', class_name: 'DliBookDescription'
  belongs_to :language
  belongs_to :author, foreign_key: 'author_id', class_name: 'Author'
  belongs_to :publisher, foreign_key: 'publisher_id', class_name: 'Publisher'
end
