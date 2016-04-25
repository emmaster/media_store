require_relative ('product.rb')

class Movie < Product
  attr_accessor :title

  def initialize(price, storage, title)
    super(price, storage)
    @title = title
  end
end

