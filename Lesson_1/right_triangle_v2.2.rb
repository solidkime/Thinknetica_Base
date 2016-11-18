puts "Привет, меня зовут Пифагор, я слышал тебя интересуют треугольники.\nПонимаю, в наше время это нелегально, но за хорошие деньги я смогу помочь тебе. Приложи сюда палец.\n...\nОтлично!\nТеперь введи длину первой стороны:"

a = gets.chomp.to_f

puts "Чего ты ждешь? Вводи длину второй стороны:"

b = gets.chomp.to_f

puts "Не делай вид, будто не знаешь, что такое треугольник. Вводи длину третьей стороны:"

c = gets.chomp.to_f
def triangle(a,b,c)
    a, b, c = [a, b, c].sort
    raise "Это не треугольник" unless a + b > c
    
    return "Равносторонний" if (a==b && b==c)
    
    isoceles =  (a==b)
    rectangular =  (a*a+b*b==c*c)

    if isoceles && rectangular
        "Равнобедренный прямоугольный"
    elsif rectangular && !isoceles
        "Прямоугольный"
    elsif isoceles && !rectangular
        "Равнобедренный"
    else
        "Просто треугольник"
    end
end

puts triangle(a,b,c)