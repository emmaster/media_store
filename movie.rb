class Movie < Product
  attr_accessor :title, :year, :director_name

  def initialize(price, storage, title = nil)
    super(price, storage)
    @title = title
  end

  def update(params)
    @title = params[:title]
    @price = params[:price]
    @year = params[:year]
    @director_name = params[:director_name]
  end

  def info
    "Фильм \"#{@title}\", #{@year} год, режиссер: #{@director_name}"
  end

end

