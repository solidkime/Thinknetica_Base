#Не моя версия, но наверное самая крутая.
def triangle(a,b,c)
	a, b, c = [a, b, c].sort
	raise "Это не треугольник" unless a + b > c
	
	return "Равносторонний" if (a==b && b==c)
	
	case [ a==b, a*a+b*b==c*c ]
	when [true, true]
		"Равнобедренный прямоугольный"
	when [false, true]
		"Прямоугольный"
	when [true, false]
		"Равнобедренный"
	else
		"Просто треугольник"
	end
end