class CreateKanajaBooks < ActiveRecord::Migration
  def change
    create_table :kanaja_books do |t|
      t.string :uri 
      t.string :title 
      t.string :author  
      t.date :avail_date  
      t.date :digi_pub_date 
      t.date :citation_date 
      t.text :description 
      t.integer :pages 
      t.string :language  
      t.string :publisher 
      t.string :rights  
      t.string :classification  
      t.string :keywords  
      t.string :en_title

      t.timestamps
    end
  end
end
