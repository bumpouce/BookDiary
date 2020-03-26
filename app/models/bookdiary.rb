class BookDiary < ActiveRecord::Base
    belongs_to :readers
    belongs_to :books

    def self.add_a_book_interface(user)
        puts "Adding a book to your diary"
        puts "---------------------------"
        puts
        BookDiary.new_bookdiary_entry_from_input(user.id)
    end

    def self.delete_an_entry_interface(user)
        puts "Deleting a book from your diary"
        puts "---------------------------"
        puts
        BookDiary.delete_an_entry(user.id)
    end

    def self.display_bookdiary_interface(user)
        puts "Here's what you've read, #{user.first_name}!"
        puts "---------------------------"
        puts
        BookDiary.display_bookdiary(user.id)
    end

    def self.new_bookdiary_entry_from_input(user_id)
        book_id = find_a_book_online
        puts
        puts "I found #{Book.all.where(id:book_id)[0].title}, by #{Book.all.where(id:book_id)[0].author}."
        puts "Is this the right book? [y]es or [n]o"
        confirm = gets.chomp.chr.downcase
        puts

        if confirm == "y"
            reread = self.are_you_rereading?(user_id, book_id)
            if reread
                date = get_date_read
                rating = get_book_rating
                self.create({user_id:user_id, book_id:book_id, read_on:date, rating:rating})
                puts "Your book diary has been updated!"
            else
                puts "Cancelled this entry." 
            end

        else 
            puts "Cancelled this entry.  Please try again, with the ISBN."
        end
    end

    def self.display_bookdiary(user_id)
        res = BookDiary.all.where(user_id: user_id)
        sorted = res.sort_by{|entry|entry.rating}.reverse
        sorted.each do |entry| 
            my_book_id = entry.book_id.to_i
            puts "#{Book.all.find(my_book_id).title}, by #{Book.all.find(my_book_id).author},"
            puts "       Rated: #{entry.rating}, read on: #{entry.read_on}"
            puts
        end
    end

    def self.are_you_rereading?(user_id, book_id)
        if self.all.where({user_id:user_id, book_id:book_id}) != []
            puts "It looks like you've read this book before.  Did you re-read it? [y]es or [n]o"
            (gets.chomp.chr.downcase == "y") ?  true : false
        else
            true
        end
    end

    def self.delete_an_entry(user_id)
        selection = find_deletion_entry(user_id)

        if selection.include? "c"
            puts
            puts "Nothing deleted."
        else
            puts
            puts "Deleting entry: #{selection}"
            BookDiary.destroy(selection)
        end
    end

    def self.find_deletion_entry(user_id)
        puts "What's the title of the book you'd like to delete from your diary?"
        title = gets.chomp.capitalize

        books = []
        entries = self.all.where(user_id:user_id)        
        books = entries.map {|entry| {entry.id=> "#{Book.all.find(entry.book_id).title}, #{Book.all.find(entry.book_id).author}, #{entry.read_on}"}}
        books.keep_if { |check| check.values[0].downcase.include? title.downcase }

        puts
        puts "I found the following entries that match your request:"
        puts
        books.each { |match| puts match}
        puts
        puts "Type the number of the item to delete or [c]ancel deletion"
        selection = gets.chomp
        selection
    end

end
  
