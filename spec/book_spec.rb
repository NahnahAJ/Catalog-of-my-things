require_relative '../books/books'

describe Book do
  before :all do
    @book = Book.new('Natanim', 'bad', '2023-01-10')
    @book_two = Book.new('John', 'good', '2020-01-12')
  end

  context '#Given parameters' do
    it 'should be an instance of book' do
      expect(@book).to be_instance_of(Book)
    end

    it 'Should instantiate with given properties' do
      expect(@book.publisher).to eql('Natanim')
      expect(@book_two.publisher).to eql('John')
    end

    it 'Should instantiate with given properties' do
      expect(@book.cover_state).to eql('bad')
      expect(@book_two.cover_state).to eql('good')
    end

    it "Should return true when 'can_be_archived' called " do
      expect(@book.can_be_archived?).to be(true)
      expect(@book_two.can_be_archived?).to be(false)
    end

    it 'Should make archives' do
      @book_two.move_to_archive
      @book.move_to_archive
      expect(@book.can_be_archived?).to be(true)
      expect(@book_two.can_be_archived?).to be(false)
    end
  end
end
