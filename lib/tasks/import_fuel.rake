require 'csv'

desc "Import Fuel Data"
task :import_fuel_data_from_csv => :environment do
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  puts "Importing Fuel Data Started"
  Rake::Task["import_fuel_module"].invoke
  Rake::Task["import_fuel_words"].invoke
  Rake::Task["import_fuel_translations"].invoke
  puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  puts "Importing Fuel Data Completed"
end

desc "Import Fuel Module"
task :import_fuel_module => :environment do
  file_name = Rails.root.to_s + '/lib/fuel_modules.csv'
  puts "Clearing Fuel modules"
  FuelModule.delete_all
  ActiveRecord::Base.connection.execute("ALTER TABLE fuel_modules AUTO_INCREMENT = 1")
  puts 'started importing modules'
  CSV.foreach(file_name, :col_sep => "\t", :headers => true) do |row|
    FuelModule.create(name: row['module'])
  end
end

desc "Import Fuel Words"
task :import_fuel_words => :environment do
  file_name = Rails.root.to_s + '/lib/fuel_words.csv'
  puts "Clearing Fuel Words"
  FuelWord.delete_all
  ActiveRecord::Base.connection.execute("ALTER TABLE fuel_words AUTO_INCREMENT = 1")
  puts "started importing words"
  language_id = Language.find_by(language_code: 'en').id
  CSV.foreach(file_name, :col_sep => "\t", :headers=> true) do |row|
    FuelWord.create(language_id: language_id, fuel_module_id: row['module_id'], name: row['Names'], context: row['context'])
  end
end

desc "Import Fuel Translations"
task :import_fuel_translations => :environment do
  file_name = Rails.root.to_s + '/lib/fuel_translations.csv'
  puts "Clearing Fuel translations"
  FuelTranslation.delete_all
  ActiveRecord::Base.connection.execute("ALTER TABLE fuel_translations AUTO_INCREMENT = 1")
  puts "started importing existing kannada translations"
  language_id = Language.find_by(language_code: 'kn').id
  CSV.foreach(file_name, :col_sep => "\t", :headers=> true) do |row|
    FuelTranslation.create(language_id: language_id, fuel_word_id: row['fuel_word_id'], name: row['name'])
  end
end