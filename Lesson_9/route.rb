# encoding: utf-8
require_relative 'accessors'
require_relative 'validation'
class Route
  include Accessors
  include Validation
  attr_reader :stations
  attr_reader :start
  attr_reader :finish

  validate :start, :type_of_inst, Station


  def initialize(start, finish)
    @start = start
    @finish = finish
    # Это имелось ввиду? >Тут стоит добавить валидации на то, что start и first - объекты именно класса Station
    # У меня же валидация это и проверяет, правда стояла не там, насколько я понял.
    validate!
    @stations = [start, finish]
  end

  # def valid?
  #   validate!
  # rescue
  #   false
  # end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  private

  # def validate!
  #   raise ArgumentError, 'Argument must be an existing station' unless (start.is_a? Station) || (finish.is_a? Station)
  #   true
  # end
end
