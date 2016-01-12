# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are
# exactly three solutions for p = 120: {20,48,52}, {24,45,51}, {30,40,50}.

# For which value of p ≤ 1000 is the number of solutions maximised?


def valid_right_triangle?(a, b, c)
  a**2 + b**2 == c**2
end

def minimum_c(perimeter)
  # Minimum hypotenuse value for a triangle with a given perimeter.
  ((perimeter.to_f / (2 + Math.sqrt(2))) * Math.sqrt(2)).to_i
end

def maximum_c(perimeter)
  perimeter / 2
end

def find_sides(c, perimeter)
  possible_combos = []
  possible_a = (1..(perimeter - c) / 2).to_a

  possible_a.each do |possibility|
    possible_combos << [possibility, perimeter - c - possibility, c]
  end

  possible_combos.delete_if {|combo| !valid_right_triangle?(combo[0], combo[1], combo[2])}.uniq.flatten
end

def triangles_for(perimeter)
  triangles = []
  (minimum_c(perimeter)..maximum_c(perimeter)).each do |c|
    triangles << find_sides(c, perimeter)
  end
  triangles.delete([])
  triangles.length
end

best_index = {0 => 0}

(1..1000).each do |perimeter|
  if triangles_for(perimeter) > best_index.values.first
    best_index = {perimeter => triangles_for(perimeter)}
  end
end

p best_index.keys.first

# => 840
