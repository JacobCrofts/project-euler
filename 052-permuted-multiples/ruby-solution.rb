def same_digit_multiples?(number)
  for i in 2..6 do
    return false if number.to_s.split(//).sort != (number * i).to_s.split(//).sort
  end
  true
end

start = Time.now

number = 12

until same_digit_multiples?(number) do
  if number.to_s.length == (number * 6).to_s.length
    number += 3
  else
    number = 10 ** (Math.log10(number).floor + 1) + 2
  end
end

p number
# 142857

p "Solved in #{(Time.now - start) * 1000} ms"