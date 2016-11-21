class Train
  attr_reader :speed
  attr_accessor :wagons
  attr_reader :id
  attr_reader :type

  def initialize(id, type)
    @id = id
    @type = type
    @wagons = []
    @speed = 0 #не указано в задании, но по моему логично
  end

  # Тут можно было бы повторить вынесения метода со скоростью, как в примере с машинами,
  # но здесь мы не заводим поезд, а просто набираем скорость. Могу поправить, если надо.
  def speed_up
    self.speed += 1
  end

  def stop
    self.speed = 0
  end

  # Можно было бы сделать super метод в каждом подклассе поезда,
  # но по моему такой вариант более DRY.
  # Так же можно было бы сделать метод без аргумента, но наверняка пригодится такой функционал.
  def wagon_plus(wagon)
    if self.type == wagon.type
      if self.speed == 0
        self.wagons << wagon
      else
        puts "Для операций с вагонами поезд должен стоять!"
      end
    end
  end

  def wagon_minus
    if self.speed == 0
      self.wagons.pop
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

  # Можно было бы перенести метод в протекдед и использовать его в go_to_next_station, 
  # но в задании указано, что поезд нужно "перемещать на станции", так что оставляю его.
  def go_to_station(index)
    current_station.minus_train(self)
    route.stations[index - 1].plus_train(self)
    self.index_station = index - 1
  end

  protected

  # Смотреть скорость можно и не опасно, а вот менять ее на любую нельзя 
  # (и невозможно моментально, если говорить о настоящем поезде).
  # Используем protected, потому что хотим, чтобы функционал сохранился и в подклассах.
  attr_writer :speed
  # :index station нельзя менять снаружи, потому что это может перемечтить поезд,
  # но не изменить состояние станции, что сломает программу 
  # и приведет к забастовке железнодожников. Меняем же мы его через паблик-методы.
  # protected, потому что он необхоим нам в подклассах
  attr_writer :index_station

  # Мы не хотим чтобы кто-то мог сменить маршрут без установки поезда на стартовую станцию.
  # Нужерн этот функционал в подклассах
  attr_writer :route

end