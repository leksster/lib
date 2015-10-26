require "faker"

module Libra
  class Generator
    attr_accessor :gen_readers, :gen_authors, :gen_books, :gen_orders, :books, :authors, :orders, :readers

    def initialize(gen_readers, gen_authors, gen_books, gen_orders)
      @gen_readers = gen_readers
      @gen_authors = gen_authors
      @gen_books = gen_books
      @gen_orders = gen_orders

      @readers = []
      @authors = []
      @books = []
      @orders = []

      gen_readers.times do |n|
        @readers << Reader.new(Faker::Name.name, Faker::Internet.email, Faker::Address.city, Faker::Address.street_name, Faker::Address.building_number)
      end
      gen_authors.times do |n|
        @authors << Author.new(Faker::Name.name, Faker::Lorem.sentence(rand(20), true))
      end
      gen_books.times do |n| 
        @books << Book.new(Faker::Book.title, @authors.sample)
      end
      gen_orders.times do
        @orders << Order.new(@books[rand(@books.length)-1], @readers[rand(@readers.length)-1])
      end
    end
  end
end