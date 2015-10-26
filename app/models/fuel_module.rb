class FuelModule < ActiveRecord::Base
  belongs_to :language
  belongs_to :fuel_module
  has_many :fuel_translations
end
