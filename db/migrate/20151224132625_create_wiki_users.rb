class CreateWikiUsers < ActiveRecord::Migration
  def change
    create_table :wiki_users do |t|
      t.boolean :is_account
      t.string :book_name
      t.string :user_name
      t.boolean :was_present
      t.boolean :is_present
      t.timestamps
    end
  end
end
