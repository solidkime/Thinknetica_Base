def perfect_weight(height)
  height - 110
end

puts "Вас приветствует программа идеальный вес!\nДля начала представьтесь:"

username = gets.chomp

puts "Замечательно!\nОсталось только ввести Ваш рост:"

user_height = gets.chomp.to_i

puts "Та-дам! #{username}, британские ученые подсчитали, что Ваш идеальный вес #{perfect_weight(user_height)}!"



