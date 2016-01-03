# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over
# five-thousand first names, begin by sorting it into alphabetical order. Then working out the
# alphabetical value for each name, multiply this value by its alphabetical position in the
# list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth
# 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of
# 938 × 53 = 49714.

# What is the total of all the name scores in the file?

file = "p022_names.txt"

def letter_value(letter)
  ("A".."Z").to_a.index(letter) + 1
end

def name_value(name)
  name.split("").inject(0) {|sum, letter| sum + letter_value(letter)}
end

names = nil

File.readlines(file).each do |line|
  names = line.split("\"").delete_if{|x| x == ","}
end

names.sort!

p names.inject(0) {|sum, name| sum + name_value(name) * names.index(name)}

# => 871198282
