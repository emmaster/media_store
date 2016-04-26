require_relative ('product.rb')
require_relative ('book.rb')
require_relative ('movie.rb')
require_relative ('music_album.rb')

items_array = []

film = Movie.new(10,20,'Ведьма из блер')
items_array << film

book = Book.new(550,5)
book.update(title: "Приключения Тома Сойера", author_name: "Марк Твен")
items_array << book


album = Music_album.new(100,5)
album.update(genre: "Jazz", artist_name: "Joe Cocker", album_name: "Best", year: 1934)
items_array << album

ans = ''
sum = 0

while 1
  Product.showcase(items_array)
  ans = STDIN.gets.chomp
  break if ans == "x"
  sum += items_array[ans.to_i].buy_one
end

puts "Спасибо за покупки! С вас: #{sum} рублей"