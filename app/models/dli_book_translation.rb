class DliBookTranslation < ActiveRecord::Base
  belongs_to :language
  belongs_to :book, foreign_key: 'book_id',class_name: 'DliBook'
  has_one :book_description, through: :book, foreign_key: 'book_id', class_name: 'DliBookDescription'
  validates_presence_of  :book_title
end
