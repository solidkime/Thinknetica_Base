#Украл у другого ученика, по мне так самый красивый вариант без выпендрежа типа лямбд.
fibonacci = [1,1]

fib_next = fibonacci[0] + fibonacci[1]

while fib_next < 100
  fibonacci << fib_next
  fib_next = fibonacci[-2] + fibonacci[-1]
end

p fibonacci

#fibonacci = [1,1]
#while (fibonacci[-2] + fibonacci[-1]) < 100
#  fibonacci << fibonacci[-2] + fibonacci[-1]
#end

#p fibonacci

###### Или так ########
#fibonacci = [1,1]
# l = lambda {fibonacci[-2] + fibonacci[-1]}
# while l.call < 100
#   fibonacci << l.call
# end

# p fibonacci
