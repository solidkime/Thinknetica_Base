module Joker

  def self.included(base)
    #base.instance_variable_set :@instances, 0
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def set_default
      self.send(:instances=, 0)
    end

    private
    attr_writer :instances
  end

  module InstanceMethods   

    def register_instance
      self.class
    end
  
    def haha
      puts "HAHAHHAAHA"
    end
    def kek
      lol
    end

    private

    def lol
      puts "LOLOLOLOLO"
    end
  end

end