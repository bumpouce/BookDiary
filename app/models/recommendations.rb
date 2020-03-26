def recommendation_interface(user)
    puts "Let's find you something new to read!"
    puts
    make_a_recommendation(user)
end

def make_a_recommendation(user)
    search = get_recommendation_parameters
    puts
    
    res = search_for_recommendations(user, search)
    suggestion = res["items"].sample

    display_recommentation(suggestion)
end

def display_recommentation(suggestion)
    puts
    puts "#{suggestion["volumeInfo"]["title"]}, by #{suggestion["volumeInfo"]["authors"]}" 
    puts "is a #{suggestion["volumeInfo"]["pageCount"]} page book about #{suggestion["volumeInfo"]["categories"]}"
    puts
    puts "Here is a description:"
    puts 
    puts "#{suggestion["volumeInfo"]["description"]}"
end

def search_for_recommendations(user, search)
    case search
    when "c"
        puts "Please enter a subject or genre keyword:"
        keyword = gets.chomp
    when "m"
        keyword = user.most_read_genre (user.id)
    else
        keyword = Faker::Book.genre
    end

    query = "subject:#{keyword.parameterize(separator: "+")}".chomp
    res = search_books_by(query)
end

def get_recommendation_parameters
    puts "Do you want a recommendation based:"
    puts "on a subject of your [c]hoice, your [m]ost read subject, or something completely [r]andom?"
    gets.chomp.chr.downcase
end

