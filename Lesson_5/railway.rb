require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Railway

  def menu

    puts "1. Создание станции"
    puts "2. Создание поезда"
    puts "3. Добавление вагонов к поезду, отсоединение вагонов от поезда и помещение поезда на станцию"
    puts "4. Вывод списка станций и список поездов на станции"
    print ' > '

    request = gets.chomp.to_i

    case request
    when 1
      create_station
    when 2
      create_train
    when 3
      edit_train
    when 4
      list
    else
      puts "Вы ввели что-то не то!"
      exit
    end
  end
  
  private

  def create_station
    stations ||= {}
    index_stations ||= 0

    loop do
      puts "Для выхода ничего не вводите и нажмите Enter"
      puts "Введите название станции:"
      print '>'
      station_name = gets.chomp
      
      if station_name == ""
        puts @stations
        menu
      else
        @stations[@index_stations] = Station.new(station_name)
        @index_stations += 1
      end
    end
  end

  def create_train
    @trains ||= {}
    @index_trains  ||= 0

    loop do
      puts "Для выхода ничего не вводите и нажмите Enter"
      puts "Выберите тип поезда:"
      puts "1. Пассажирский"
      puts "2. Грузовой"
      train_type = gets.chomp.to_i
      print '>'

      case train_type
      when 1
        puts "Создаем пассажирский поезд"
        puts "Введите номер поезда"
        train_id = gets.chomp.to_i
        print '>'
        @trains[@index_trains] = Train.new(train_id, :passenger)
        @index_trains += 1
      when 2
        puts "Создаем грузовой поезд"
        puts "Введите номер поезда"
        train_id = gets.chomp.to_i
        print '>'
        @trains[@index_trains] = Train.new(train_id, :cargo)
        @index_trains += 1
      when 0
        puts @trains
        menu
      end
    end
  end

  def edit_train

    loop do

    puts "Выберите поезд с которым будем проводить операции:"
    puts "Чтобы выбрать поезд введите его порядковый или по умолчанию будет выбран нулевой поезд:"
   
    @trains.each do |index, train|
      puts "#{index}. айди поезда:#{train.id}, тип поезда: #{train.type}"
    end

     print ">"

    request = gets.chomp.to_i


      if @trains[request]
        train = @trains[request]
      else
        "Такого поезда нет в списке."
        menu
      end

      puts "Вы выбрали поезд #{train.id}. Какую операцию хотите провести?"
      puts "1. Прицепить вагон"
      puts "2. Отцепить вагон"
      puts "3. Отправить поезд на станцию"

      request = gets.chomp.to_i

      case request
      when 1
        if train.type == :passenger
          wagon = PassengerWagon.new
        elsif train.type == :cargo
          wagon = CargoWagon.new
        end
        train.wagon_plus(wagon)
      when 2
        train.wagon_minus
      when 3
        puts "Можно поместить поезд на такие станции:"
        @stations.each do |index, station|
          puts "Station number #{index} named #{station.name}"
        end
        puts "Введите номер станции или нажмите Enter для выхода"

        station_number = gets.chomp.to_i

        if @stations.has_key?(station_number)
          station = @stations[station_number]
          #или здесь стоит сделать добавление станции к атрибутам поезда? Без роута это конечно не очень.
          station.plus_train(train) #!!!
        else
          puts "Такой станции не существует"
          menu
        end
        
      when 0
        puts "Вы ввели что-то не то"
        menu
      end
    end
  end

  def list
    puts @stations
    puts @trains
    menu
  end

  attr_accessor :stations
  attr_accessor :trains
  attr_accessor :index_trains
  attr_accessor :index_stations
end