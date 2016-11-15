
puts "Число"
date = gets.chomp.to_i
puts "Месяц"
month = gets.chomp.to_i
puts "Год"
year = gets.chomp.to_i

def visokos(year)
  if year % 4 == 0 && ( year % 400 == 0 || year % 100 != 0 )
  end
end

months = [31,28,31,30,31,30,31,31,30,31,30,31]
months[1] = 29 if visokos(year)




days = months.take(month).reduce(:+) -  date
puts days