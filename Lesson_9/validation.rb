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
        inst_var = instance_variable_get("@#{check[:name]}")
        # puts 'wat'
        # puts check[:args].inspect
        # puts 'wat'
        send check[:type], inst_var, check[:args]
      end
      true
    end
    
    def valid?
      validate!
    rescue
      false
    end

    protected

    def presence(inst_var, _args)
      raise "Имя не может быть nil или пустой строкой" if inst_var.to_s.empty? 
    end

    def format(inst_var, regexp_args)
      raise "Имя должно соответствовать заданному формату" if inst_var !~ regexp_args[0]
    end

    def type_of_inst(inst_var, type_args)
      raise "Заданный атрибут не совпадает с классом" unless inst_var.class == type_args[0]
    end
  end
end

