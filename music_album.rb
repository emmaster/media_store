require_relative ('product.rb')

class Music_album < Product
  attr_accessor :title

  def initialize(price, storage, title)
    super(price, storage)
    @title = title
  end
end

