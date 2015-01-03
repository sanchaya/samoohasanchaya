class Author < ActiveRecord::Base
 has_many :author_translations, dependent: :destroy
 has_many :books
end
