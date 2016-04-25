require_relative ('product.rb')
require_relative ('book.rb')
require_relative ('movie.rb')
require_relative ('music_album.rb')

film = Movie.new(10,20,'Ведьма из блер')

puts film.title
