require_relative ('product.rb')

class Book < Product
  attr_accessor :title

  def initialize(price, storage, title)
    super(price, storage)
    @title = title
  end
end

