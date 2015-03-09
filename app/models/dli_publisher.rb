class DliPublisher < ActiveRecord::Base
  has_many :dli_publisher_translations, dependent: :destroy
  has_many :dli_books, foreign_key: 'publisher_id'
end
