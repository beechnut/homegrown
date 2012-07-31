# tests for probability work using random number generators,
# hashes with test values,
# and arrays with values collecting and writing case blocks
# checks itself for distribution of 2 or 3 choices

one_possibility = { "output" => "first", "min" => 0, "max" => 0.49 }
second_possibility = { "output" => "second", "min" => 0.5, "max" => 1 }

@smallnums = 0
@bignums = 0



def tryout ( probability, random_number )

	case random_number
		when 0..probability
			puts random_number.to_s + " is less than " + probability.to_s
			@counter_one += 1
		when probability..100
			puts random_number.to_s + " is more than " + probability.to_s
			@counter_two += 1
		else
			puts random_number.to_s + " not in range"
	end

end



def two_choices ( probability, number_of )

	if probability > 100
		puts "Enter the first probability: "
		probability = gets.chomp
	end

	unless number_of > 0
		puts "Enter a number of times to run: "
		number_of = gets.chomp
	end
	
	@counter_one = 0
	@counter_two = 0
		
	number_of.times do
		tryout ( probability, rand(100) )
	end

	percent_one = ('%.2f' % (@counter_one.to_f*100 / number_of.to_f)).to_s + "%"
	percent_two = ('%.2f' % (@counter_two.to_f*100 / number_of.to_f)).to_s + "%"

	
	puts "| " + percent_one + " first prob || " + percent_two + " second prob |"
	
end



def three_choices
	puts "function not defined yet"
end



def probable ( random_number )

	case random_number
	when 0..50
		puts random_number.to_s + " is between 0..0.5"
		@smallnums += 1
	when 50..100
		puts random_number.to_s + " is between 0.5..1"
		@bignums += 1
	else
		puts random_number.to_s + "not in range"
	end
	
end


# run the random distribution
def go_time ( number_of )

	number_of.times do
		probable ( rand(100) ) 
	end
	
	puts @smallnums.to_s + " smallnums | " + @bignums.to_s + " bignums"

end