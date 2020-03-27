class Book < ActiveRecord::Base
    has_many :diaries
    has_many :readers, through: :diaries

    def self.retrieve_or_add_book(info)
        title = info["items"][0]["volumeInfo"]["title"]
        author = info["items"][0]["volumeInfo"]["authors"][0]
        published = info["items"][0]["volumeInfo"]["publishedDate"]
        subject = info["items"][0]["volumeInfo"]["categories"]
  
        if Book.where({title:title, author:author}) == []
            book = Book.create({title:title, author:author, publication_date:published, subject:subject})
        else
            book = Book.where({title:title, author:author}).first
        end
        book
    end
end