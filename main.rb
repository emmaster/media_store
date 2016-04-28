require 'rexml/document'

require_relative ('product.rb')
require_relative ('book.rb')
require_relative ('movie.rb')
require_relative ('music_album.rb')

current_path = File.dirname(__FILE__)
xml_file_path = current_path + '/storage.xml'
xml_storage = Product.read_xml(xml_file_path)

items_array = []

xml_storage.elements.each("products/product/movie") do |movie|

  film = Movie.new(movie.parent.attributes['price'].to_i,movie.parent.attributes['stock'].to_i,movie.attributes['title'])
  film.update({
    :title=> movie.attributes['title'],
    :director_name => movie.attributes['director_name'],
    :year => movie.attributes['year']
  })
  items_array<<film
end



xml_storage.elements.each("products/product/book") do |book|
  book_item = Book.new(book.parent.attributes['price'].to_i,book.parent.attributes['stock'].to_i,book.attributes['title'])
  book_item.update({
    :title => book.attributes['title'],
    :author_name => book.attributes['author_name']
  })
  items_array<<book_item
end

xml_storage.elements.each("products/product/music_album") do |album|
  album_item = Movie.new(album.parent.attributes['price'].to_i,album.parent.attributes['stock'].to_i,album.attributes['title'])
  album_item.update({
    :title => album.attributes['title'],
    :director_name => album.attributes['artist_name'],
    :year => album.attributes['year'],
    :genre => album.attributes['genre']
  })
  items_array<<album_item
end

ans = ''
sum = 0

while 1
  Product.showcase(items_array)
  ans = STDIN.gets.chomp
  break if ans == "x"
  sum += items_array[ans.to_i].buy_one
end

puts "Спасибо за покупки! С вас: #{sum} рублей"