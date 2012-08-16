def generate(axiom, rule_list, number_of_times)
	# Make the first word the axiom, so the axiom remains undestructed.
	@word = axiom
	# Establish the array of words, the steps.
	# Make the axiom index = 0, so that indexing step 1 gets you production 1.
	@words = [@word]
	# Repeat the given number of times
	@number_of_times = number_of_times
	number_of_times.times do
		# Go through every rule and
		@rules = rule_list
		@rules.each do | rule |
			# Determine the predecessor regex and successor to use
			@word.gsub!( rule.run[0], rule.run[1] )	# Be destructive. Go ahead. Maybe dup?
			#But add it to the array of steps for safekeeping.
			@words << @word
		end # loop
	end
	return @word
end