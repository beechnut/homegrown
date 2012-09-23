def letter_array(word)

@letters = word.split(//)
@array = []
	
	@lpos = 0
	@rpos = 0
	
	for ind in @lpos..@letters.length-1
		
		#base case
		# letters are different
		# puts substring
		@this = @letters[ind]
		@that = @letters[ind+1]
		
		if @this != @that or ind.to_i == @letters.length-1.to_i
			puts ind.to_s + " (" + @lpos.to_s + ", " + @rpos.to_s + ")"
			puts @this + " is different from " + @that.to_s
			@substring = @word[@lpos..@rpos]
			puts @substring
			@array << @substring
			
			@lpos = @rpos + 1
			@rpos = @lpos
		end
		
		#recursive case
		# letters are same
		# advance one letter
		if @this == @that
			puts ind.to_s + ":"
			puts @this + " is same as " + @that
			@rpos += 1
		end
		
	end
	
	if @word == @array.join
		puts "Successfully ran!"
		puts @word.to_s
		puts @array.join.to_s
	else
		puts "Errors: (word) " + @word.to_s + " != (array) " + @array.join.to_s
	end
	
	return @array
	
end

