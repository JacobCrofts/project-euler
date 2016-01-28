start_time = Time.now

def pythagorean_triplet?(a, b, c)
  a ** 2 + b ** 2 == c ** 2
end

pythagorean_triplets = []

a = 1
until a == 1000
  b = a
  until b == 1000
    c = 1000 - (a + b)
    pythagorean_triplets << [a, b, c] if pythagorean_triplet?(a, b, c)
    b += 1
  end
  a += 1
end

p pythagorean_triplets[0].reduce(:*)
p "calculated in #{(Time.now - start_time) * 1000} ms"
