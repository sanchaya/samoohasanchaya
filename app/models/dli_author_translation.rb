class DliAuthorTranslation < ActiveRecord::Base
  belongs_to :author, foreign_key: 'author_id',class_name: 'DliAuthor'
end
