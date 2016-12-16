module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :checks

    def validate(name, type, *args)
      @checks ||= []
      @checks << {type: type, name: name, args: args}
    end
  end

  module InstanceMethods

    def validate!
      self.class.checks.each do |check|
        send check[:type], check[:name], check[:args]
      end
    end
    
    def valid?
      validate!
    rescue
      false
    end

    private

    def presence(name, *_more)
      raise "Имя не может быть nil или пустой строкой" if instance_variable_get("@#{name}").to_s.empty? 
    end

    def format(name, regexp_args)
      raise "Имя должно соответствовать заданному формату" if instance_variable_get("@#{name}") !~ regexp_args[0]
    end

    def type(name, type_args)
      raise "Заданный атрибут не совпадает с классом" unless instance_variable_get("@#{name}").class == type_args[0]
    end
  end
end

