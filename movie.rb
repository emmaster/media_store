class Movie < Product
  attr_accessor :title, :year, :director_name

  def initialize(price, storage, title = nil)
    super(price, storage)
    @title = title
  end

  def update(data_hash)
    @title = data_hash[:title] if data_hash.has_key?(:title)
    @price = data_hash[:price] if data_hash.has_key?(:price)
    @year = data_hash[:year] if data_hash.has_key?(:year)
    @director_name = data_hash[:director_name] if data_hash.has_key?(:director_name)
  end

  def info
    "Фильм \"#{@title}\", #{@year} год, режиссер: #{@director_name}"
  end

end

