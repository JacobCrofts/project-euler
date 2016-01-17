# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in
# two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations
# of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property,
# but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

require 'prime'

class Integer

  def permutations
    self.to_s.split("").permutation.to_a.map {|subarr| subarr.join("").to_i}
  end

  def prime_permutations
    self.permutations.select {|perm| perm.prime?}
  end

  def self.four_digit_primes
    Prime.take_while {|prime| prime < 10_000}.select {|prime| prime > 999}
  end

  def prime_permutation_of?(number)
    self.prime_permutations.include?(number)
  end

end

class Array

  def repeating_elements
    self.select {|elem| self.count(elem) > 1}.uniq
  end

  def difference
    self[0] > self[1] ? self[0] - self[1] : self[1] - self[0]
  end

  def differences
    diffs = {}
    self.combination(2).to_a.each do |combo|
      diffs[combo] = combo.difference
    end
    diffs
    # self.combination(2).to_a.map {|combo| combo.difference}
  end

  def has_two_common_differences?
      self.differences.each do |diff|
        return true if differences.count(diff) == 2
      end
    false
  end

  # def common_difference
  #   diffs = self.differences
  #   common_differences = []
  #   diffs.each do |diff|
  #     common_differences << diff if diffs.count(diff) == 2
  #   end
  #   common_differences
  # end

end

class Hash

  def common_differences
    common_values = self.values.repeating_elements

    common_differences = {}

    self.select do |key, value|
      # Find
    end

    # self.select {|key, value| common_values.include?(value)}
  end

end

p [1487, 1847, 4817, 4871, 8147, 8741, 7481, 7841].differences.common_differences

# p 1487.prime_permutation_of?(4817)

# p 1487.prime_permutations

# possibilities = Integer.four_digit_primes.select {|prime| prime.prime_permutations.has_two_common_differences?}

# p possibilities.length

# {number => common_difference} make it a hash?