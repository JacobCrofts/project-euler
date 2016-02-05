start_time = Time.now

file = "/Users/jacobcrofts/project-euler/022-names-scores/p022_names.txt"

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
p "calculated in #{(Time.now - start_time) * 1000} ms"
