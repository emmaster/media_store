class Music_album < Product
  attr_accessor :title

  def initialize(price, storage, title = nil)
    super(price, storage)
    @album_name = title if title != nil
  end

  def update(data_hash)
    @album_name = data_hash[:album_name] if data_hash.has_key?(:album_name)
    @price = data_hash[:price] if data_hash.has_key?(:price)
    @year = data_hash[:year] if data_hash.has_key?(:year)
    @artist_name = data_hash[:artist_name] if data_hash.has_key?(:artist_name)
    @genre = data_hash[:genre] if data_hash.has_key?(:genre)
  end

  def info
    "Музыкальный альбом \"#{@album_name}\", #{@year} год, жанр: #{@genre}, исполнитель: #{@artist_name}"
  end
end

