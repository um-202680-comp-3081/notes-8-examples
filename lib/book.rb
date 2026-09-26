# lib/book.rb
class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @available = true
  end

  def available?
    @available
  end

  def check_out
    @available = false
  end

  def check_in
    @available = true
  end
end
