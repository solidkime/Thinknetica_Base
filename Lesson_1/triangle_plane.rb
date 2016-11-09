def triangle_plane(base, height)
  1.0/2.0*base*height
end

puts "Здравствуй, мой юный друг!\nВижу ты тоже ненавидишь геометрию! Поэтому мой друг, обезьянка Мао посчитает за тебя!\nПожалуйста введи длину основания треугольника:"

base = gets.chomp.to_f

puts "Скорее! Введи высоту:"

height = gets.chomp.to_f

puts "Так ты не выучишь формулу, но вот ответ: #{triangle_plane(base, height)}"