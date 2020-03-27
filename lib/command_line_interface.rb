def welcome
  puts
  puts "      ____              _    ____  _                       "
  puts "__/\\_| == )  ___   ___ | | _|  _ \\(_) __ _ _ __ _   ___/\\__"
  puts "\\    /  _ \\ / _ \\ / _ \\| |/ / | | | |/ _` | '__| | | \\    /"
  puts "/_  _\\ |_) | (_) | (_) |   <| |_| | | (_| | |  | |_| /_  _\\"
  puts "  \\/ |____/ \\___/ \\___/|_|\\_\\____/|_|\\__,_|_|   \\__, | \\/  "
  puts "                                                |___/      "
  puts "                              created by Christine Bumpous"
  puts
  puts "Welcome to the Book Diary!"
  puts
end

def goodbye(user)
  puts 
  puts
  puts"     ______ ______"
  puts"   //      Y      \\"
  puts"  // ~~ ~~ | ~~ ~  \\"
  puts" // ~ ~ ~~ | ~~~ ~~ \\"      
  puts"//________.|.________\\"    
  puts"`---------`-'---------"
  puts
  puts "Thanks for using Book Diary, #{user.first_name}!"
  puts "See you later!"
  puts
end

def set_user
  puts
  puts "---------------------------"
  puts
  puts "Are you a [n]ew or [r]eturning user?"
  user_type = gets.chomp.chr.downcase
  if user_type == "n"
    puts
    user = Reader.create_reader    
  elsif user_type == "r"
    puts
    user = Reader.find_reader
  else
    puts "I'm sorry, I don't understand.  Please try again."
    set_user
  end

  puts "Hi, #{user.first_name}!"
  puts "---------------------------"
  puts
  user
end

def get_command
  puts "What would you like to do?"
  puts
  puts "[A]dd a book to your Book Diary"
  puts "[D]elete a book from your Book Diary"
  puts
  puts "[V]iew your Book Diary"
  puts "[S]ee your Book Diary statistics"
  puts
  puts "[G]et a book recommendation"
  puts "[M]anage your user account"
  puts
  puts "[E]xit?"
  input = gets.chomp.chr.downcase
end

def execute_command (input, user)
  puts

  case input

  when "a"
    Diary.add_a_book_interface(user)
  when "d"
    Diary.delete_an_entry_interface(user)
  when "v"
    Diary.display_diary_interface(user)
  when "s"
    Reader.display_reading_statistics_interface(user)
  when "g"
    recommendation_interface(user)  
  when "m" 
    Reader.manage_user_interface(user)
  when "e"

  else
    puts "Sorry, I don't know that command."
  end

  puts
  puts "---------------------------"
  puts
end

def get_search_parameters
  search_info = []
  puts
  puts "How would you like to add your book? [T]itle + Author or [I]SBN?"
  search_type = gets.chomp
  if search_type.chr.downcase == "t"
    puts
    puts "Please enter the full or partial title:"
    title = gets.chomp.parameterize(separator: "+")
    search_info << "intitle:#{title}"
    puts
    puts "Please enter the full or partial author name:"
    author = gets.chomp.parameterize(separator: "+")
    search_info << "+inauthor:#{author}"
  elsif search_type.chr.downcase == "i"
    puts
    puts "Please enter complete ISBN-10:"
    search_info << "isbn:#{gets.chomp.tr('-', '')}"
  else
    puts "I'm sorry, that search isn't possible."
  end
  search_info.empty? ? search_info<<"isbn:0062502174" : search_info
end


def get_date_read
  puts
  puts "When did you read this book? YYYY/MM/DD"
  gets.chomp
end

def get_book_rating
  puts
  puts "In whole numbers, 0(worse for having read it)-5(changed my life), how would you rate this book?"
  gets.chomp.to_i
end

