def find_a_book_online
  search = get_search_parameters

  query = build_search_string(search)
  res = search_books_by(query)

  book = Book.retrieve_or_add_book(res)
  book.id
end


def search_books_by(search_string)
  response_string = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{search_string}")
  response_hash = JSON.parse(response_string)

  if response_hash["totalItems"] == 0
    response_string = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=isbn:0399226907") #if no results were found, use very hungry caterpillar instead
    response_hash = JSON.parse(response_string)
  else
    response_hash
  end
end


def build_search_string(input)
  input.join
end
