def nth_permutation(digits, n)
  digits.permutation(digits.length).to_a[n - 1].join("").to_i
end

p nth_permutation([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 1_000_000)
