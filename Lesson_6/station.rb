class Station
  STATION_FORMAT = /^[A-z][a-z]+$/
  attr_reader :name
  attr_reader :trains

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end


  def self.all
    @@all_stations
  end

  def plus_train(train)
    trains << train
  end

  def minus_train(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    current_trains = []
    trains.each do |train|
      current_trains << train if train.type == type
    end
  end

  private
  def validate!
    raise "Station must contain only letters and start with a capital letter" if name !~ STATION_FORMAT
    true
  end
  # Смотреть сколько у нас поездов в массиве указано в условии задачи, 
  # а вот менять этот массив можно только через другие методы, чтобы не всунуть вместо массива что-то неподходящее.
  attr_writer :trains
end

