# If the numbers 1 to 5 are written out in words: one, two, three, four,
# five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written
# out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
# and forty-two) contains 23 letters and 115 (one hundred and fifteen)
# contains 20 letters. The use of "and" when writing out numbers is in
# compliance with British usage.


def number_to_word(number)
  ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  teens = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

  case number
  when (1..9) then ones[number - 1]
  when (11..19) then teens[number % 10 - 1]
  when (10..99) then tens[number / 10 - 1] + number_to_word(number % 10)
  when (100..999)
    if number % 100 == 0
      ones[number / 100 - 1] + "hundred"
    else
    ones[number / 100 - 1] + "hundredand" + number_to_word(number % 100)
    end
  when 1000 then "onethousand"
  when 0 then ""
  end

end

words = []

(1..1000).each {|number| words << number_to_word(number)}

p words.join("").length

# => 21124

# Pretty straightforward, except that this problem requires us to say "and" here
# and there in accordance with British convention. If you're trying this problem
# and getting 18451, then you probably have the same problem as I did.