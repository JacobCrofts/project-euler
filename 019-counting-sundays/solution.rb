def days_in(year)
  if year % 4 != 0
    365
  elsif year % 400 == 0
    366
  elsif year % 100 == 0
    365
  elsif year % 4 == 0
    366
  else
    365
  end
end

p days_in_1900s = (1901..2000).inject(0) {|sum, year| sum + days_in(year)}

def sundays_from(date_1, date_2) #[year, ]

end