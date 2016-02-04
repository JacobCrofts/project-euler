start_time = Time.now

def days_in(year)
  if year % 400 == 0
    366
  elsif year % 100 == 0
    365
  elsif year % 4 == 0
    366
  else
    365
  end
end

leap_year_months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
normal_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days_in_1900s = (1901..2000).inject(0) {|sum, year| sum + days_in(year)}

sundays = []
firsts_of_months = []
sundays_on_firsts_of_months = 0

(1..days_in_1900s).each {|day| sundays << ((day + 1) % 7 == 0)}

(1901..2000).each_with_index do |year, index|
  if days_in(year) == 366
    leap_year_months.each do |days_in_month|
      firsts_of_months << true
      (days_in_month - 1).times { firsts_of_months << false}
    end
  else
    normal_months.each do |days_in_month|
      firsts_of_months << true
      (days_in_month - 1).times { firsts_of_months << false}
    end
  end
end

(0...days_in_1900s).each do |day_index|
  sundays_on_firsts_of_months += 1 if sundays[day_index] == true && firsts_of_months[day_index] == true
end

p sundays_on_firsts_of_months
p "calculated in #{(Time.now - start_time) * 1000} ms"


# This was a tedious problem. No doubt there's an easier way to do it using the Time/DateTime
# modules, but I decided to do it manually as an extra challenge. If you're working on the same
# problem and getting something very close to the correct answer, be sure you're calculating
# whether a year is a leap year correctly, and check any ranges you have (e.g. (1..some_variable))
# to make sure you aren't offsetting your data. The difference between .. and ... or 0.. and 1..
# may make the difference between a correct and incorrect answer.