require_relative "libra/version"
require_relative "libra/book"
require_relative "libra/order"
require_relative "libra/reader"
require_relative "libra/author"
require_relative "libra/generator"
require "faker"

module Libra
  
  class Library
    attr_accessor(:name, :books, :orders, :readers, :authors)

    def initialize(name, books=[], orders=[], readers=[], authors=[])
      @name = name
      @books = books
      @orders = orders
      @readers = readers
      @authors = authors
    end

    def show_all_books
      books.each { |book| puts book.title }
    end

    def top_reader
      hash = Hash.new(0)
      orders.each { |order| hash[order.reader.name] += 1 }
      hash.sort { |key, value| value[1] <=> key[1] }[0]
    end

    def top_3_books
      hash = Hash.new(0)
      orders.each { |order| hash[order.book.title] += 1 }
      hash.sort { |key, value| value[1] <=> key[1] }[0..2].to_h
    end

    def top_book
      hash = Hash.new(0)
      orders.each { |order| hash[order.book.title] += 1 }
      hash.sort { |key, value| value[1] <=> key[1] }.to_h.keys[0]
    end


    def count_people_from_top_3
      people = []
      orders.each { |order| people << order.reader.name if top_3_books.include?(order.book.title)}

      people.uniq
    end

  end

end


