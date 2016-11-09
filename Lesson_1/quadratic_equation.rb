puts "Привет! В детстве мне тяжело давались квадратные уравнения, но будь у меня такая программа, я бы в них никогда не разобрался\nВведите 'a':"
a = gets.to_f
puts "Введите 'b':"
b = gets.to_f
puts "Вижу вы серьезно настроены решить это уравнение. Введите 'c':"
c = gets.to_f




def quad_eq(a,b,c)
  d = (b**2) - 4*a*c
    if d < 0
  		puts "Корней нет. D = #{d}"
  	elsif d > 0
      d_sqrt = Math.sqrt(d)
  		x1 = (-b + d_sqrt ) / 2*a
  		x2 = (-b - d_sqrt / 2*a

  		puts "D = #{d}, x1 = #{x1}, x2 = #{x2}"
  	elsif d == 0
  		x = -b/(2*a)
  		puts "D = #{d}, x1 и x2 = #{x}"
  	end
end

quad_eq(a,b,c)