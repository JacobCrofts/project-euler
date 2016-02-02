start_time = Time.now

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
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 21124
