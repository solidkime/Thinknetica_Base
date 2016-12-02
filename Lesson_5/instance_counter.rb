module InstanceCounter

  def self.include(base)
    base.extend ClassMethods
    base.send :include, InstanceMethoods
  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethoods

    private
    def register_instance
      self.class.instances += 1
    end
  end
end


  module ClassMethods
    attr_accessor :instances
    def instances
    @instances = 0
  end