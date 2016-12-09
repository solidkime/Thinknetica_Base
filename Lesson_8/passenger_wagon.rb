# encoding: utf-8
class PassengerWagon < Wagon
  attr_reader :type
  attr_reader :places
  attr_reader :free_places

  def initialize(places)
    @type = :passenger
    @places = places
    @free_places = places
  end

  def take_place
    if free_places > 0
      self.free_places -= 1
    else
      puts 'В вагоне не осталось свободных мест'
    end
  end

  def taken_places
    places - free_places
  end

  private

  attr_writer :places
  attr_writer :free_places
end
