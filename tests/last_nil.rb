# last nil

@array = [nil, 12, 12]

def last_nil

	@i = @array.length-1
	
	while @i >= 0 do
	
		puts "i = " + @i.to_s
		
		if @array[@i].nil?
			puts @i.to_s + " is nil"
			break
		end
	
		@i -= 1
		puts @array.to_s
		
	end
	
	puts "loop ended"
	puts "the last nil is at index " + @i.to_s

end