module InstanceCounter

  def self.include(base)
    base.extend ClassMethods
    base.send :include, InstanceMethoods
  module ClassMethods
  end

  module InstanceMethoods
  end
end