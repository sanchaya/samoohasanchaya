class VoteTranslation < ActiveRecord::Base
  has_many :fuel_translations
  belongs_to :user

  
  def self.create_update_vote(user, translation,fuel_word)
    voted = user.vote_translations.where(fuel_word_id: fuel_word).first
    if voted
      voted.update_attribute('fuel_translation_id', translation)
    else
      user.vote_translations.create(fuel_translation_id: translation, fuel_word_id: fuel_word)
    end
  end

end
