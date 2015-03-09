class DliBook < ActiveRecord::Base
  has_many :dli_book_translations, dependent: :destroy
  has_one :dli_book_description, dependent: :destroy
  belongs_to :language
  belongs_to :dli_author, foreign_key: 'author_id'
  belongs_to :dli_publisher, foreign_key: 'publisher_id'
end
