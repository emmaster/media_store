class Product

  attr_accessor :price

  def initialize(price,storage)
    @price = price
    @storage = storage
  end

  def update
  end

  def info
  end

  def buy_one
    if @storage > 0
      @storage -= 1
      puts "Вы купили товар #{info}"
      return @price
    else
      puts "Покупка не удалась. Товара нет в наличии"
      return nil
    end
  end

  def show
    info + " – #{@price} руб." +" [осталось: #{@storage}]"
  end

  def self.showcase(product_array)
    puts
    puts "Что хотите купить?"
    puts
    product_array.each_with_index do |item, index|
      puts "#{index}. "+item.show
    end
    puts "x. Покинуть магазин"
  end
end