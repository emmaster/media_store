class MusicAlbum < Product
  attr_accessor :title, :price, :storage

  def initialize(price, storage, title = nil)
    super(price, storage)
    @album_name = title
    @year
    @artist_name
    @genre
  end

  def update(params)
    @album_name = params[:album_name]
    @price = params[:price] if params[:price] != nil
    @year = params[:year]
    @artist_name = params[:artist_name]
    @genre = params[:genre]
  end

  def info
    "Музыкальный альбом \"#{@album_name}\", #{@year} год, жанр: #{@genre}, исполнитель: #{@artist_name}"
  end
end

