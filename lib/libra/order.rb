module Libra
  class Order
    attr_accessor(:book, :reader)
    attr_reader(:date)

    def initialize(book, reader)
      @book = book
      @reader = reader
    end

    def to_s
      "#{book}, #{reader}"
    end
  end
end