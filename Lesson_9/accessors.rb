module Accessors
  def attr_accessor_with_history(*names)
    # self here is Class
    names.each do |name|
      # self here is Class
      # instance_variable_set("@#{name}_history".to_sym, [])
      var_name = "@#{name}".to_sym
      var_name_history = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }
      end
      # self here is Class
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name_history, []) unless instance_variable_get(var_name_history)
        instance_variable_set(var_name, value)
        instance_variable_get(var_name_history).send(:<<, value) # или лучше закинуть instance_variable_get(var_name_history) в переменную и закидывать туда все по обычному?
      end

      define_method("#{name}_history".to_sym) { instance_variable_get(var_name_history) }
    end
  end

  def strong_attr_accessor(name, var_class)
    var_name = "@#{name}".to_sym

    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      raise ArgumentError unless value.class.to_s == var_class.to_s
      instance_variable_set(var_name, value)
    end
  end    
