require_relative './books'
require 'json'
class BooksHandler
  attr_accessor :books

  def initialize(labels)
    if File.exist?('./books/books.json')
      @file = File.read('./books/books.json')
      @books = JSON.parse(@file,{ symbolize_names: true })
    else
      @books = []
    end
    #@labels = labels
  end

  def list_books
    puts "There is currently no books in store." if @books.empty?
    @books.each_with_index do |book,index|
      print " "
      print "(#{index+1}). => Publisher: #{book[:publisher]} | Label: #{book[:label]}"
      puts "\n"
      puts "\tCover state: #{book[:cover_state]} | publish date: #{book[:publish_date]} "
    end
  end

  def add_book
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter cover state good (y) or bad (n): '
    state = gets.chomp
    state_result = ""
    if state == "y" || state == "Y"
      state_result ="good"
    elsif state == "n" || state == "N"
      state_result = "bad"
    end
    print 'Enter Publish date(yyyy-mm-dd): '
    date = gets.chomp
    puts "Date: #{date} | State: #{state_result} | Publisher: #{publisher}"
    book = Book.new(publisher,state_result,date)
    new_book = { publisher: publisher, cover_state: state_result, publish_date: date}
    @books << new_book
    File.write('./books/books.json', JSON.dump(@books))
    puts 'The book added successfully 😊'
  end

end

booksHandler = BooksHandler.new("good")
booksHandler.add_book