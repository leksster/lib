require_relative "libra"


# Number of generated items
readers = 30
authors = 350
books = 1000
orders = 100

# Initialize generator instance
gen = Libra::Generator.new(readers, authors, books, orders)

# Create Library
mylib = Libra::Library.new("MyNameIsLib", gen.books, gen.orders, gen.readers, gen.authors)

# Tasks
puts "************** Who often takes the book:\n"
p mylib.top_reader

puts "************** What is the most popular book:\n"
p mylib.top_book

puts "************** How many people ordered one of the three most popular books:\n"
p mylib.people_orders_from_top3

#Save all Library data to file(s)
puts "************** Saving data to files info.json, data.yaml:\n"
mylib.export_to_json #./info.json
mylib.save_to_yaml #./data.yaml
puts "************** Done\n"

#Load library from files(s)
puts "************** Loading data from data.yaml:\n"
load = Libra::Library.load
p load.show_all_books
puts "************** Done\n"


load.to_json
