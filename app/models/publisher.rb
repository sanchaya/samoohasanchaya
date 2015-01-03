class Publisher < ActiveRecord::Base
  has_many :publisher_translations, dependent: :destroy
  has_many :books
end
