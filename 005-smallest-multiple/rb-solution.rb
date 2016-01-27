start_time = Time.now

def divisible_by_1_thru_20?(int)
  (11..20).each do |factor|
    return false if int % factor != 0
  end
  true
end

counter = 2520

until divisible_by_1_thru_20?(counter)
  counter += 2520
end

p counter
p "calculated in #{(Time.now - start_time) * 1000} ms"
