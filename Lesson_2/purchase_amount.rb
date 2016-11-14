cart = {}
loop do
  puts "Название товара:"
  product_name = gets.chomp

  if product_name == "stop"
    puts cart

    cart_total = 0
    cart.each do |k, v|
      prouct_total_price = v[:price] * v[:amount]
      puts "Итоговая сумма товара #{k} : #{prouct_total_price}"
      cart_total += prouct_total_price
    end



    puts "Сумма всех покупок в корзине: #{cart_total}"
    break
  end

  puts "Цена за единицу:"
  product_price = gets.chomp.to_f
  puts "Количество товара:"
  product_amount = gets.chomp.to_f

  cart[product_name] = {price: product_price, amount: product_amount}
end
