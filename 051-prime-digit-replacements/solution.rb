def is_prime?(number)
  (2..Math.sqrt(number)).each do |possible_factor|
    return false if number % possible_factor == 0
  end
  true
end

def number_of_prime_family_members(number, digit_to_replace)
  char_to_replace = digit_to_replace.to_s
  count = 0

  ("0".."9").each do |replacement_char|
    possible_family_member = number.to_s.gsub(char_to_replace, replacement_char).to_i
    next if possible_family_member.to_s.length != number.to_s.length
    count += 1 if is_prime?(possible_family_member)
  end

  count
end

def in_family_of_eight?(number)
  (0..9).to_a.each do |digit|
    return true if number_of_prime_family_members(number, digit) == 8
  end
  false
end

number = 2

until (is_prime?(number) && in_family_of_eight?(number))
  number += 1
  p number
end

p number
# 121313
