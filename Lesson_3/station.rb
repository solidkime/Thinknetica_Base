class Station
  attr_accessor :trains
  attr_reader :name


  def initialize(name)
    @name = name
    @trains = []
  end

  def plus_train(train)
    trains << train
  end

  def minus_train(train)
    trains.delete(train) if trains
  end

  def trains_by_type(type=nil)
    if type
      current_trains = []
      trains.each do |train|
        current_trains << train if train.type == type
      end
    end
  end
end

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

  def delete_station(station)
    stations.delete(station)
  end
end

class Train
  attr_accessor :speed
  attr_accessor :wagons
  attr_reader :id
  attr_reader :type
  attr_accessor :index_station
  attr_accessor :route

  def initialize(id, type, wagons)
    @id = id
    @type = type
    @wagons = wagons
    @speed = 0 #не указано в задании, но по моему логично
  end

  def speed_up
    self.speed += 1
  end

  def stop
    self.speed = 0
  end
#  Возможно лучше было бы два метода вместо wagons_action, но задание звучит
#  будто нужен один метод. Могу переделать.
def wagons_action(action)
  if self.speed == 0
    case action
    when 'plus'
      self.wagons += 1
    when 'minus'
      self.wagons -=1
    end
  else
    puts "Для операций с вагонами поезд должен стоять!"
  end
end

def get_route(route)
  self.route = route
  self.index_station = 0
  current_station.plus_train(self)
end

def current_station
  route.stations[@index_station]
end

def next_station
  if index_station != route.stations.count #show_current_station != route.stations.last
    route.stations[index_station + 1]
  else
    puts "Поезд уже на конечной"
  end
end

def previous_station
  if index_station > 0
    route.sations[@index_station - 1]
  elsif index_station == 0
    puts "Поезд уже на начальной." 
  end

end

def go_to_next_station
  if index_station < (route.stations.count -1)
      self.index_station +=1
      current_station.minus_train(self)
      next_station.plus_train(self)
    else
      puts 'Поезд уже на кончной'
    end
end

def go_to_station(index)
end










end