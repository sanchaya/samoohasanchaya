class DliAuthor < ActiveRecord::Base
  has_many :author_translations, foreign_key: 'author_id',class_name: 'DliAuthorTranslation', dependent: :destroy
  has_many :books, foreign_key: 'author_id',class_name: 'DliBook'
end
