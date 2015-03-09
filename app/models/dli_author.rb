class DliAuthor < ActiveRecord::Base
  has_many :dli_author_translations, dependent: :destroy
  has_many :dli_books, foreign_key: 'author_id'
end
