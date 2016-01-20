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
end

class Array
  def difference
    self[0] > self[1] ? self[0] - self[1] : self[1] - self[0]
  end

  def differences
    diffs = {}
    self.combination(2).to_a.each do |combo|
      diffs[combo] = combo.difference
    end
    diffs.select {|k,v| v != 0}
  end
end

class Hash
  def common_differences
    self.select do |key, value|
      self.select {|k,v| v == value}.keys.flatten.uniq.length == 3
    end
  end

  def special_concatenated_number
    number = self.common_differences.keys.flatten.uniq.sort.join("")
    number.length == 12 ? number : ""
  end
end

counter = 1000
concat_num = counter.prime_permutations.differences.special_concatenated_number

until concat_num != "" && concat_num != "148748178147"
  counter += 1
  concat_num = counter.prime_permutations.differences.special_concatenated_number
end

p concat_num.to_i

# => 296962999629
