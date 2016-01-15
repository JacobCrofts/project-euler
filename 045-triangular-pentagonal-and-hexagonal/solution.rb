class Integer

  def to_tri
    self * (self + 1) / 2
  end

  # Derive these with the quadratic formula.
  def triangle?
    index = (Math.sqrt(8 * self + 1) - 1) / 2.0
    index == index.to_i
  end

  def pentagonal?
    index = (Math.sqrt(1 + 24 * self) + 1) / 6.0
    index == index.to_i
  end

  def hexagonal?
    index = (1 + Math.sqrt(1 + 8 * self)) / 4.0
    index == index.to_i
  end

end

tri_pent_hexes = []
index = 1

until tri_pent_hexes.length == 3 # because 1 is also a tri/pent/hex number.
  triangle = index.to_tri
  tri_pent_hexes << triangle if triangle.pentagonal? && triangle.hexagonal?
  index += 1
end

p tri_pent_hexes[-1]

# => 1533776805

# I'm starting to get the hang of these class methods. Expect more such solutions in the future!
