class DliPublisherTranslation < ActiveRecord::Base
  belongs_to :publisher, foreign_key: 'publisher_id',class_name: 'DliPublisher'
end
