module InstanceCounter
#Это не надо проверять, это пока неудачные наброски.
  def self.include(base)
    base.extend ClassMethods
    base.send :include, InstanceMethoods
  end

  module ClassMethods
    attr_accessor :instances
  module InstanceMethoods

    private
    def register_instance
      self.class.instances += 1
    end
  end
end