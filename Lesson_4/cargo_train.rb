class CargoTrain < Train
  attr_reader :type

  def initialize
    @type = :cargo
  end

  def wagon_plus
    if type
    super

  end
end