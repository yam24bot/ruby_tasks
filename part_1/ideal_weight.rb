puts 'Введите Ваше имя:'
name = gets.chomp
puts 'Введите ваш рост:'
height = gets.chomp.to_f
puts 'Введите ваш вес:'
weight = gets.chomp.to_f
ideal_weight = height - 110

if ideal_weight == weight
  puts 'Ваш вес уже идеален'
elsif ideal_weight > weight.to_i
  puts "Вам надо набрать #{ideal_weight - weight} кг для достижения идеального веса"
else
  puts "Вам надо сбросить #{weight - ideal_weight} кг для достижения идеального веса" 
end
