class CreateVoteTranslations < ActiveRecord::Migration
  def change
    create_table :vote_translations do |t|
      t.integer :user_id
      t.integer :fuel_translation_id
      t.integer :fuel_word_id
      t.boolean :value
      t.timestamps
    end
  end
end
