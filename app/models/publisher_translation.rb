class PublisherTranslation < ActiveRecord::Base
  belongs_to :publisher
  validates_presence_of  :name  
end
