class CreateDliPublisherTranslations < ActiveRecord::Migration
  def change
    create_table :dli_publisher_translations do |t|
      t.integer :user_id
      t.integer :language_id
      t.integer :publisher_id
      t.string :name
      t.timestamps
    end
  end
end
