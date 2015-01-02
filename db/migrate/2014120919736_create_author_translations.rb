class CreateAuthorTranslations < ActiveRecord::Migration
  def change
    create_table :author_translations do |t|
      t.integer :user_id
      t.integer :language_id
      t.integer :author_id
      t.string :name
      t.timestamps
    end
  end
end
