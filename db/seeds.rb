# # Add seed data here. Seed your database with `rake db:seed`

Reader.delete_all
Book.delete_all
BookDiary.delete_all

christine = Reader.create(:username=>'bookworm', 'first_name'=>'Christine')
emily = Reader.create(:username=>'cozy', 'first_name'=>'Emily')
tarah = Reader.create(:username=>'craftyreader', 'first_name'=>'Tarah')

book1 = Book.create(:title=>'What Rosie Did Next', :author=>'Nina Dufort', :publication_date=>'2000', :subject=>'Bars (Drinking establishments)')
book2 = Book.create(:title=>'Dünya Bir Köy Olsaydı', :publication_date=>'2005', :subject=>'Geography')
book3 = Book.create(:title=>'宏村', :author=>'金艺辉', :publication_date=>'2005', :subject=>'Hong Cun (Anhui Sheng, China)')
book4 = Book.create(:title=>'徽州乡土村落', :author=>'张十庆', :publication_date=>'2014')
book5 = Book.create(:title=>'L''Afrique des villages', :author=>'Jean-Marc Ela', :publication_date=>'1982', :subject=>'Africa')

puts "Done!"