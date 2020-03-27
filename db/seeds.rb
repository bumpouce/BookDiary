# # Add seed data here. Seed your database with `rake db:seed`
require_relative '../config/environment.rb'

Reader.delete_all
Book.delete_all
Diary.delete_all

IntegerConverter = Object.new
def IntegerConverter.convert(value)
  Integer(value)
end

reader_hash = SmarterCSV.process('db/BackupData/readers.csv', value_converters: { id: IntegerConverter })
reader_hash.each {|reader| Reader.create(reader)}

book_hash = SmarterCSV.process('db/BackupData/books.csv', value_converters: { id: IntegerConverter })
book_hash.each {|book| Book.create(book)}

diary_hash = SmarterCSV.process('db/BackupData/bookdiaries.csv', value_converters: { id: IntegerConverter })
diary_hash.each {|diary| Diary.create(diary)}

puts "Done!"