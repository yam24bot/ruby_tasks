#3. Заполнить массив числами фибоначи до 100

def fibo n
  if n == 1 || n == 2
    1
  else
    fibo( n - 1 ) + fibo(n - 2)
  end
end

nums = []
 
(1..100).each do |num|
  nums.push fibo(num)
end

puts nums
