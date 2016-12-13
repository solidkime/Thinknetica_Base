# encoding: utf-8
class Passenger < Train
  attr_reader :type

  def initialize
    @type = :passenger
  end
end
