class CreateDliPublishers < ActiveRecord::Migration
  def change
    create_table :dli_publishers do |t|
      t.string :name
      t.integer :language_id
      t.timestamps
    end
  end
end
