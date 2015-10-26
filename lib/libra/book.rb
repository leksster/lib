module Libra

  class Book
    attr_reader(:title, :author)

    def initialize(title, author)
      @title = title
      @author = author
    end

    def to_s
      "#{title}, #{author}"
    end

  end
end