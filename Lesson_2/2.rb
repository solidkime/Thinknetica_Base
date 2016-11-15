array = []
x = 10
until x > 100
  array << x
  x += 5
end
p array
#Прикольное решение, но не мое
# array = []

# (10..100).step(5) {|a| array << a}

# puts array