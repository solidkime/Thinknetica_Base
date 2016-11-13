abc = {}
vowels_hash = {}
vowels = ["a", "e", "i", "o", "u"]

#Если бы я знал про то, что у рейнджей тоже есть each with index - дальше было бы красивее :)
n = 1
('a'..'z').each do |letter|
  abc[letter] = n
  n +=1
end

vowels.each do |letter|
  vowels_hash[letter.to_sym] = abc[letter] 
end

puts vowels_hash
  

