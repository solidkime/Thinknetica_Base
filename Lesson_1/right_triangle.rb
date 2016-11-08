puts "Привет, меня зовут Пифагор, я слышал тебя интересуют треугольники.\nПонимаю, в наше время это нелегально, но за хорошие деньги я смогу помочь тебе. Приложи сюда палец.\n...\nОтлично!\nТеперь введи длину первой стороны:"

a = gets.chomp.to_f

puts "Чего ты ждешь? Вводи длину второй стороны:"

b = gets.chomp.to_f

puts "Не делай вид, будто не знаешь, что такое треугольник. Вводи длину третьей стороны:"

c = gets.chomp.to_f



def triangle(a,b,c)
  triangle = [a,b,c]
  triangle.sort!

  hypo = triangle[2]
  first_side = triangle[0]
  second_side = triangle[1]

  if (first_side**2) + (second_side**2) == (hypo**2)
    puts "SOX"
  end

  if (a == b || b == c || a == c) && ((first_side**2) + (second_side**2)) == (hypo**2)
    puts "Треугольник равнобедренный и прямоугольный" #Не нашел рабочий пример из-за хитрости дробных чисел в руби
  elsif a == b && b ==c
    puts "Треугольник равнобедренный и равносторонний"
  elsif (first_side**2) + (second_side**2) == (hypo**2) #Math.hypot(first_side, second_side) == hypo
    puts "Треугольник прямоугольный"
  elsif a == b || b == c || a == c
    puts "Треугольник равнобедренный!"
  else 
    puts "Что-то пошло не так."
  end
end

triangle(a,b,c)