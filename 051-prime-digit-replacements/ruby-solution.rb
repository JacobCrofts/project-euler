def is_prime?(number)
  (2..Math.sqrt(number)).each do |possible_factor|
    return false if number % possible_factor == 0
  end
  true
end

def number_of_prime_family_members(number, digit_to_replace)
  count = 0
  char_to_replace = digit_to_replace.to_s
  skip_zero = number.to_s[0] == digit_to_replace.to_s

  ("0".."9").each do |replacement_char|
    next if skip_zero && replacement_char == "0"
    possible_family_member = number.to_s.gsub(char_to_replace, replacement_char).to_i
    count += 1 if is_prime?(possible_family_member)
  end

  count
end

def in_family_of_eight?(number)
  (0..9).to_a.each do |digit|
    next if number.to_s[-1] == digit.to_s
    return true if number_of_prime_family_members(number, digit) == 8
  end
  false
end

start_time = Time.now

number = 2

until (is_prime?(number) && in_family_of_eight?(number))
  number += 1
  # p number
end

p number
# 121313

p "calculated in #{(Time.now - start_time) * 1000} ms"
# roughly 30 seconds