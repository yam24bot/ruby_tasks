puts "Введите коэффициенты a, b и c через пробел:"
nums = gets.chomp.split(" ")

a = nums[0].to_f
b = nums[1].to_f
c = nums[2].to_f

d = b*b - 4*a*c

puts "Дискриминант равен #{d}"

if d < 0
  puts "Корней нет!"
else
  x_1 = (-1*b + Math.sqrt(d))/(2*a)
  x_2 = (-1*b - Math.sqrt(d))/(2*a)
  
  puts "Корни уравнения: #{x_1} #{x_2}"
end

