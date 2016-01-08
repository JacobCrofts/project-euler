# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)

def palindromic?(number)
  number.to_s.reverse == number.to_s
end

# def to_base_10(binary_number)
#   digits = binary_number.to_s.split("").reverse
#   digits.map.with_index {|digit, index| 2 ** index * digit.to_i}.reduce(:+)
# end

def to_binary(number)

  binary = ""

  power = 0
  until 2 ** power > number
    power += 1
  end

  power -= 1

  until number == 0
    if number > 2 ** power
      number -= 2 ** power
      binary << "1"
    elsif number == 2 ** power
      binary << "1"
      (power - 1).times {binary << "0"}
      number = 0
    else
      binary << "0"
      number -= 2 ** power
    end
    power -= 1
  end

  binary
end

p to_binary(33)