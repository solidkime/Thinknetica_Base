# encoding: utf-8
require_relative 'manufacturer'
require_relative 'accessors'
class Wagon
  include Manufacturer
  include Accessors
  # Предполагаю, что пригодится в будущих заданиях.
end
