module Libra
  class Order
    attr_accessor(:book, :reader)
    attr_reader(:date)

    def initialize(book, reader)
      @book = book
      @reader = reader
    end
    
  end
end