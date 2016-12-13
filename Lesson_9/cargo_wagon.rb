# encoding: utf-8
class CargoWagon < Wagon
  attr_reader :type
  attr_reader :space
  attr_reader :free_space

  def initialize(space)
    @type = :cargo
    @space = space
    @free_space = space
  end

  def take_space
    if free_space > 0
      self.free_space -= 1
    else
      puts 'В вагоне не осталось свободного места'
    end
  end

  def taken_space
    space - free_space
  end

  private

  attr_writer :space
  attr_writer :free_space
end
