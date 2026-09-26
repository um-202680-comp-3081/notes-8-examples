# spec/book_spec.rb
require 'book'

RSpec.describe Book do
  let(:book) { Book.new('1984', 'George Orwell') } # instantiates a fresh obj for each test 

  describe '.new' do
    it 'stores the title and author' do
      # book = Book.new('1984', 'George Orwell') provided by let(:book)
      expect(book.title).to eq('1984')
      expect(book.author).to eq('George Orwell')
    end

    it 'starts available' do
      # book = Book.new('1984', 'George Orwell') provided by let(:book)
      expect(book).to be_available
    end
  end

  describe '#check_out' do
    context 'when the book is available' do
      it 'makes the book unavailable' do
        # book = Book.new('1984', 'George Orwell') provided by let(:book)
        book.check_out
        expect(book).not_to be_available
      end
    end

    context 'when the book is already checked out' do
      it 'leaves the book unavailable' do
        # book = Book.new('1984', 'George Orwell') provided by let(:book)
        book.check_out
        book.check_out
        expect(book).not_to be_available
      end
    end
  end

  describe '#check_in' do
    context 'when the book is checked out' do
      it 'makes the book available again' do
        # book = Book.new('1984', 'George Orwell') provided by let(:book)
        book.check_out
        book.check_in
        expect(book).to be_available
      end
    end

    context 'when the book is already available' do
      it 'leaves the book available' do
        # book = Book.new('1984', 'George Orwell') provided by let(:book)
        book.check_in
        expect(book).to be_available
      end
    end
  end
end
