class Route
  attr_reader :stations
  attr_reader :start
  attr_reader :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
    # Это имелось ввиду? >Тут стоит добавить валидации на то, что start и first - объекты именно класса Station
    # У меня же валидация это и проверяет, правда стояла не там, насколько я понял.
    validate!
    @stations = [start, finish]
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
  
  private

  def validate!
    raise ArgumentError, "Argument must be an existing station" unless start.is_a? Station || (finish.is_a? Station)
    true
  end
end