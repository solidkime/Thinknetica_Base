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
    trains.delete(train)
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














