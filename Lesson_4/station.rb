class Station
  attr_reader :name
  attr_reader :trains


  def initialize(name)
    @name = name
    @trains = []
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
  # Смотреть сколько у нас поездов в массиве указано в условии задачи, 
  # а вот менять этот массив можно только через другие методы, чтобы не всунуть вместо массива что-то неподходящее.
  attr_writer :trains
end

