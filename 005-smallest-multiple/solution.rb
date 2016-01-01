# 2520 is the smallest number that can be divided by each
# of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?


def divisible_by_1_thru_20?(int)
  (11..20).each do |factor|
    return false if int % factor != 0
  end
  true
end

counter = 2520

until divisible_by_1_thru_20?(counter)
  counter += 2520
end

p counter

# => 232792560


# Mathematical logic saves time here! Note that if a number is
# divisible by two integers, a and b, then the number must also
# be divisible by the product (a * b). The same applies to
# multiple integers (i.e. a, b, c, d, ...).

# I know that 2520 is the smallest integer divisible by all
# in the range (1..10). So I can safely assume that my answer
# is divisible by 2520, and increment my counter accordingly.

# Similarly, I only need to check to see if my number is
# divisible by the range (11..20) because the factors of the
# values in that range include numbers divisible by (1..10).
# For example, 12 is divisible by 2, 3, 4, and 6, so if a
# number is divisible by 12, then it's also divisible by 2,
# 3, 4, and 6.
