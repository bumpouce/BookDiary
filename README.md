# BookDiary Command Line Application

## Objectives

0. This application is created with Ruby.
1. A user will be able to create and access an account where they can
	-create and add to a diary of books they have read, give the book a rating, and note when they read it
	-remove an entry from the book diary based on a title
	-view the books they have entered in their diary
	-see some statistics about their reading, including what genre and author they have read most, and how many books they recorded
	-get suggestions based on genre
	-update their username or first name any time
2. The application will interact with Google books API +JSON for book records and recommendations.
3. All users, read books and book diaries will be stored in a local database.

![](https://i0.hippopx.com/photos/361/762/550/books-book-stack-stack-literature-thumb.jpg)

## To Run the Application

Fork and clone this project to your own work environment.
From the project main folder
	> ruby bin/run.rb

Now you can follow the instructions in the application.  Use [e] from the main menu to exit.

## Required GEMS

A number of GEMs are required for this application.  You should be prompted to install them if you are missing any, but they include: 
	gem "activerecord", "~> 5.2.3"			
	gem 'sinatra-activerecord'
	gem 'rake'			
	gem 'require_all'
	gem 'sqlite3', '~>1.3.6'			
	gem 'pry'
	gem 'rest-client'			
	gem 'faker'
	gem 'rspec'				  	
	gem 'rack-test'
  	gem 'database_cleaner'

## Database Schema (version: 2020_03_25_025454)

  create_table "book_diaries", force: :cascade do |t|
    t.string "user_id"
    t.string "book_id"
    t.string "read_on"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "publication_date"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

## Possible future additions

-This project currently has no security features.  Users could require passwords to log in and access their Book Diary information

-The user account data could include more personal information about the user like age demographic, gender, region

-Users could add subject tags to the books they add to the Book Diary

-Recommendations could have more search options like language, length, author, reviews

-Users could save recommendations or add them if they've already been read but not entered into the Book Diary