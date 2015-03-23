class DliPublisher < ActiveRecord::Base
  has_many :publisher_translations, foreign_key: 'publisher_id',class_name: 'DliPublisherTranslation', dependent: :destroy
  has_many :books, foreign_key: 'publisher_id',class_name: 'DliBook'
end
