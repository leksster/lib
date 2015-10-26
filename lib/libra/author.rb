module Libra
  class Author
    attr_accessor :name, :biography

    def initialize(name, biography)
      @name = name
      @biography = biography
    end

    def to_s
      "#{name}, #{biography}"
    end
  end
end