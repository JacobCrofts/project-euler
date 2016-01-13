# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten
# triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its alphabetical position and adding
# these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If
# the word value is a triangle number then we shall call the word a triangle word.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly
# two-thousand common English words, how many are triangle words?

file = "p042_words.txt"

names = nil

File.readlines(file).each do |line|
  names = line.split("\"").delete_if {|word| word == "," || word == ""}
  # sanitizing our input: we collected one empty string at the beginning
end

def letter_value(letter)
  letters = ("A".."Z").to_a
  letters.index(letter) + 1
end

def word_value(word)
  word.split("").inject(0) {|sum, letter| sum + letter_value(letter)}
end

def triangle_value?(value)
  # Quadratic formula here. We can reject the other solution, -1 - Math.sqrt(...) / 2 because that would always be a negative number.
  triangle_index = (-1 + Math.sqrt(1 + 8 * value)) / 2
  triangle_index == triangle_index.to_i
end

def triangle_word?(word)
  triangle_value?(word_value(word))
end

p names.select {|name| triangle_word?(name)}.length

# => 162
