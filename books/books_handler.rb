require_relative './books'
require_relative '../label/label'
require 'json'
class BooksHandler
  attr_accessor :books

  def initialize(labels)
    if File.exist?('./books/books.json')
      @file = File.read('./books/books.json')
      @books = JSON.parse(@file, { symbolize_names: true })
    else
      @books = []
    end
    @labels = labels
  end

  def list_books
    puts 'There is currently no books in store.' if @books.empty?
    @books.each_with_index do |book, index|
      print ' '
      print "(#{index + 1}). ID: #{book[:id]} | Publisher: #{book[:publisher]} | Label: #{book[:label]}"
      puts "\n"
      puts "\tCover state: #{book[:cover_state]} | publish date: #{book[:publish_date]} "
    end
  end

  def add_book
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter cover state good (y) or bad (n): '
    state = gets.chomp
    state_result = ''
    case state
    when 'y', 'Y'
      state_result = 'good'
    when 'n', 'N'
      state_result = 'bad'
    end
    print 'Enter Publish date(yyyy-mm-dd): '
    date = gets.chomp
    puts 'Select which label the book should have'
    @labels.list_labels
    index = gets.chomp.to_i
    book = Book.new(publisher, state_result, date)
    # book.label = @labels.labels[index - 1]
    hash = @labels.labels[index - 1]
    book.add_label(Label.new(hash[:title], hash[:color]));
    new_book = { id: book.id, publisher: publisher, cover_state: state_result, publish_date: date,
                 label: book.label.title }
    @books << new_book
    File.write('./books/books.json', JSON.dump(@books))
    puts 'The book added successfully 😊'
  end
end
