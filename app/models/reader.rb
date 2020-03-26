class Reader < ActiveRecord::Base
    has_many :book_diaries
    has_many :books, through: :book_diaries

    def self.create_reader
        username = ""
        name = ""

        puts "Thanks for joining Book Diary!"
        while name == ""
          puts "What's your first name?"
          name = gets.chomp
        end
        puts

        while username == "" || (Reader.where(username:username) != [])
          puts "Please choose a new username:"
          username = gets.chomp
        end
        
        Reader.create({username:username, first_name:name})

      end
      
      def self.find_reader
        puts "What's your username?"
        username = gets.chomp
        puts

        while Reader.where(username:username) == []
          puts "Please try again, we could not find your username!"
          username = gets.chomp
          puts
        end

        Reader.where(username: username)[0]
    end
      
    def self.update_user(user)
      puts
      puts "Change [u]sername or [f]irst name?"
      option = gets.chomp.chr.downcase
      puts
      if option == "u"
        puts "Your username is currently #{user.username}"
        puts "What's the new username?"
        update = gets.chomp
        Reader.all.find(user.id).update(username:update)
      else
        puts "Your first name is currently #{user.first_name}"
        puts "What's the new first name?"
        update = gets.chomp
        Reader.all.find(user.id).update(first_name:update)
      end
    end

    def self.manage_user_interface(user)
      puts "Change your username or first name"
      Reader.update_user(user)
    end

    def self.display_reading_statistics_interface(user)
      puts "Here are some statistics about your reading, #{user.first_name}:"
      puts
      puts "Your most read genre is: #{user.most_read_genre (user.id)}"
      puts "Your most read author is: #{user.most_read_author (user.id)}"
      puts "You have logged #{user.book_count(user.id)} books with Book Diary!"
    end  


    def most_read_genre (user_id)
      if self.book_count(user_id) == 0
        return "[no book diary entries]"
      end
      count = Hash.new(0)
      this = BookDiary.all.where(user_id: user_id)
      this.map{|entry| Book.all.find(entry.book_id).subject}.each{|subject| count[subject] += 1}
      count.max_by{|k,v| v}.empty? ? "Emptiness" : count.max_by{|k,v| v}[0].split("\"")[1]
    end

    def most_read_author (user_id)
      if self.book_count(user_id) == 0
        return "[no book diary entries]"
      end
      count = Hash.new(0)
      this = BookDiary.all.where(user_id: user_id)
      this.map{|entry| Book.all.find(entry.book_id).author}.each{|subject| count[subject] += 1}
      count.max_by{|k,v| v}[0]
    end

    def book_count(user_id)
      BookDiary.all.where(user_id: user_id).count
    end
end
  