class Route
  attr_reader :stations

  def initialize(start, finish)
    @start = start
    @finish = finish
    @stations = [start, finish]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  
  private

  #Пользователю нельзя удалять станции, поезд и станция тоже не должны влиять на маршрут
  def delete_station(station)
    stations.delete(station)
  end
end