#a"2 = b"2 + c"2
and_isosceles = ""
puts "Введите три стороны треугольника через пробел"

arr = gets.split(" ")

arr.sort!.reverse!

a = arr[0].to_i
b = arr[1].to_i
c = arr[2].to_i

if a + b > c &&  a + c > b && b + c > a
  puts "Треугольник существует"
else
  puts "Треугольник не существует"
  return
end

if a == b && b == c
  puts "Треугольник равносторонний и не может быть прямоугольным"
  return
else a == b || b == c || c == a
  and_isosceles = " и равнобедренный"
end

if a ** 2 == b ** 2 + c ** 2
  puts "Треугольник прямоугольный#{and_isosceles}"
else
  puts "Треугольник не прямоугольный"
end
  



