class FuelModule < ActiveRecord::Base
  belongs_to :language
  has_many :fuel_words
end
