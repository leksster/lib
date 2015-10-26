require_relative "libra/version"
require_relative "libra/book"
require_relative "libra/order"
require_relative "libra/reader"
require_relative "libra/author"
require_relative "libra/generator"
require 'json'
require 'yaml'


module Libra
  
  class Library
    attr_accessor(:name, :books, :orders, :readers, :authors)

    def initialize(name=nil, books=[], orders=[], readers=[], authors=[])
      @name = name
      @books = books
      @orders = orders
      @readers = readers
      @authors = authors
    end

    def show_all_books
      list = []
      books.each { |book| list << book.title }
      list
    end

    def top_reader
      hash = Hash.new(0)
      orders.each { |order| hash[order.reader.name] += 1 }
      hash.sort { |key, value| value[1] <=> key[1] }[0]
    end

    def top_book
      hash = Hash.new(0)
      orders.each { |order| hash[order.book.title] += 1 }
      hash.sort { |key, value| value[1] <=> key[1] }[0]
    end

    def top_3_books
      hash = Hash.new(0)
      orders.each { |order| hash[order.book.title] += 1 }
      hash.sort { |key, value| value[1] <=> key[1] }[0..2].to_h
    end

    def people_orders_from_top3
      people = []
      orders.each { |order| people << order.reader.name if top_3_books.include?(order.book.title)}
      people.uniq
    end

    def to_json
      { self.name => { :books => books, :orders => orders, :authors => authors, :readers => readers } }
    end

    def export_to_json
      File.open('info.json', 'w') do |f|
      f.write(JSON.pretty_generate(self.to_json))
      end
    end

    def save_to_yaml
      File.open('data.yaml', 'w') do |f|
        f.write(self.to_yaml)
      end
    end

    def self.load
      YAML.load(File.open('data.yaml', 'r').read)
    end

  end

end


