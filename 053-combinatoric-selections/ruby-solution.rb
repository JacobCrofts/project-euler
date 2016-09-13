def factorial(number)
  return 1 if number == 0
  (1..number).reduce(:*)
end

start = Time.now

count = 0

n = 23
r = 10
cache = (0..100).map { |x| x = factorial(x) }

until (n == 100 && r == 100) do
  count += 1 if cache[n] / (cache[r] * cache[n - r]) > 1_000_000
  if r == n
    n += 1
    r = 1
  else
    r += 1
  end
end

p count
# 4075

p "Solved in #{(Time.now - start) * 1000} ms"
