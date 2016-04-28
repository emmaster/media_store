class Book < Product
  attr_accessor :title, :author_name, :price

  def initialize(price, storage, title = nil)
    super(price, storage)
    @title = title if title != nil
  end

  def update(params)
    @title = params[:title]
    @price = params[:price] if params[:price] != nil
    @author_name = params[:author_name]
  end

  def info
    "Книга \"#{@title}\", автор: #{@author_name}"
  end
end