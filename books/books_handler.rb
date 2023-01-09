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
    @labels = labels
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
end

booksHandler = BooksHandler.new("good")
booksHandler.list_books
