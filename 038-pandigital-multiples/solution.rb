# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576

# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call
# 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving
# the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated
# product of an integer with (1,2, ... , n) where n > 1?

def pandigital_9?(number)
  number.to_s.split("").sort == "123456789".split("")
end

def concatenated_product(number, max)
  (1..max).to_a.reduce("") {|string, index| string + (number * index).to_s}
end

def min_checkable_number(max)
  # this could boost performance, if needed
end

# n, in the example provided, cannot exceed 9. Otherwise, we'll have minimum string lengths that exceed 9.

max_pandigital = 0

(1..9).each do |n|
  number_to_check = 1
  until concatenated_product(number_to_check, n).length > 9
    max_pandigital = concatenated_product(number_to_check, n).to_i if concatenated_product(number_to_check, n).to_i > max_pandigital
    number_to_check += 1
  end
end

p max_pandigital