class FuelWord < ActiveRecord::Base
  has_many :fuel_words
  belongs_to :fuel_module
end
