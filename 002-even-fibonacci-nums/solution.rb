def fib_nums_up_to(max)
  fib_nums = [1, 2]
  until fib_nums[-1] >= max
    fib_nums << fib_nums[-1] + fib_nums[-2]
  end
  fib_nums[0..-2]
end

fibonacci_nums = fib_nums_up_to(4_000_000)
even_fibonacci_nums = fibonacci_nums.select! { |val| val.even? }

p even_fibonacci_nums.reduce(:+)
