class Book < Product
  attr_accessor :title, :author_name, :price

  def initialize(price, storage, title = nil)
    super(price, storage)
    @title = title if title != nil
  end

  def update(data_hash)
    @title = data_hash[:title] if data_hash.has_key?(:title)
    @price = data_hash[:price] if data_hash.has_key?(:price)
    @author_name = data_hash[:author_name] if data_hash.has_key?(:author_name)
  end

  def info
    "Книга \"#{@title}\", автор: #{@author_name}"
  end
end