# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

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

solution = pythagorean_triplets[0].reduce(:*)

p solution

# => 31875000


# the triplet itself is [200, 375, 425]
