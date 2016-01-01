# Each new term in the Fibonacci sequence is generated
# by adding the previous two terms. By starting with 1
# and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence
# whose values do not exceed four million, find the sum
# of the even-valued terms.

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

# => 4613732
