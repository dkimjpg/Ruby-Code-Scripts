def stock_picker(stocks)
	#Loop through the array once, and record only when the next value is increasing (greater than the current value)
	#Or stop if the last value is reached
	#stocks.each do |day|
	#for day in 0...stocks.length() do
	stock_ranges = Hash.new
	stock_hashes = Hash.new
=begin
	day = 0
	buy_day = 0
	sell_day = 0
	until day == (stocks.length() - 2) do
		if stocks[day] <= stocks[day + 1]
			buy_day = day
			sell_day = day + 1
		#else
		end
	end
=end
	#new idea: Put all values of the array into a hash table, then traverse that hash table
	for day in 0...stocks.length() do
		#stock_hashes[stocks[day]] = day
		stock_hashes[day] = stocks[day]
	end
	#p stock_hashes
	stock_hashes.each do |key, value|
		max = stock_hashes.max_by{|k, v| v}.first
		#p max
		#p key
		#p stock_hashes[key]
		#p stock_hashes[max]
		stock_ranges[[key, max]] = [stock_hashes[max] - stock_hashes[key]] #check if this makes stock_ranges nil when stock_hashes gets deleted
		#p stock_hashes
		stock_hashes.delete(key)
		#p stock_hashes
	end
	#p stock_ranges

	best_range = stock_ranges.max_by{|k, v| v}.first
	#p best_range
	return best_range

end

p stock_picker([17,3,6,9,15,8,6,1,10])
