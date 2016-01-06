# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify
# it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less than one in value, and
# containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms, find the value of the
# denominator.

# def less_than_one?(numerator, denominator)
#   numerator < denominator
# end

def commonalities(numerator, denominator)
  coms = []
  (numerator.to_s.split("") + denominator.to_s.split("")).combination(2).to_a.each do |combo|
    coms << combo.first.to_i if combo.uniq != combo
  end
  coms.select {|x| x != 0}
end

def remove_commonalities(numerator, denominator)
  new_fractions = []
  commonalities(numerator, denominator).each do |com|
    new_numerator = numerator.to_s.split("") - [com.to_s]
    new_denominator = denominator.to_s.split("") - [com.to_s]
    new_fractions << [new_numerator.first.to_i, new_denominator.first.to_i]
  end
  new_fractions
end

def curious_fraction?(numerator, denominator)
  remove_commonalities(numerator, denominator).each do |new_fraction|
    return true if numerator.to_f / denominator == new_fraction[0].to_f / new_fraction[1]
  end
  false
end

def common_factor(num1, num2)
  (2..num1 / 2).to_a.each do |possible_factor|
    return possible_factor if num1 % possible_factor == 0 && num2 % possible_factor == 0
  end
end

def lowest_common_terms(numerator, denominator)
  # until common_factor(numerator, denominator) == nil
  #   numerator = numerator / common_factor(numerator, denominator)
  #   puts numerator
  #   denominator = denominator / common_factor(numerator, denominator)
  # end
  # [numerator, denominator]
end

checkable_fractions = []
curious_fractions = []

(10..99).to_a.each do |numerator|
  (numerator + 1..99).to_a.each do |denominator|
    checkable_fractions << [numerator, denominator]
  end
end

p lowest_common_terms(4, 8)

# p checkable_fractions.select {|frac| curious_fraction?(frac[0], frac[1])}