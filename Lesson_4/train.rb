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


  def wagon_plus
    if self.speed == 0
      self.wagons += 1 
    else
      puts "Для операций с вагонами поезд должен стоять!"
    end
  end

  def wagon_minus
    if self.speed == 0
      self.wagons -= 1
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
    if index_station != (route.stations.count)- 1 #show_current_station != route.stations.last
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
    if index_station < (route.stations.count - 1)
      current_station.minus_train(self)
      next_station.plus_train(self)
      self.index_station +=1
      else
        puts 'Поезд уже на конечной'
      end
  end

  def go_to_station(index)
    current_station.minus_train(self)
    route.stations[index - 1].plus_train(self)
    self.index_station = index - 1
  end
end