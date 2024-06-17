def stock_picker(stocks)
	#Loop through the array once, and record only when the next value is increasing (greater than the current value)
	#Or stop if the last value is reached
	stock_ranges = Hash.new
	stock_hashes = Hash.new

	#new idea: Put all values of the array into a hash table, then traverse that hash table and get the max range value
	# from the current iteration and save it as a value in a new hash table, with the key being the range indices.
	# Then, just find the largest range value in the new hash table and return the range index.
	for day in 0...stocks.length() do
		stock_hashes[day] = stocks[day]
	end
	stock_hashes.each do |key, value|
		max = stock_hashes.max_by{|k, v| v}.first
		stock_ranges[[key, max]] = [stock_hashes[max] - stock_hashes[key]] #check if this makes stock_ranges nil when stock_hashes gets deleted
		stock_hashes.delete(key)
	end

	best_range = stock_ranges.max_by{|k, v| v}.first
	return best_range

end

p stock_picker([17,3,6,9,15,8,6,1,10])
