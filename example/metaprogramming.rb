# class Foo
#   def initialize
#     @bar = "instance var"
#   end

#   private

#   def private_method
#     puts "I'm a private method"
#   end
# end

module MyAttrAccessor
  def my_attr_accessor(*names) # принимаем имя метода, который нужно создать
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) } # Чтобы передать аргументы в метод мы указываем их в пайпах
    end
  end
end

class Test
  extend MyAttrAccessor

  my_attr_accessor :my_attr, :a, :b, :c 
end
