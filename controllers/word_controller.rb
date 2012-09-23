# Word
# Word  PRIME DIRECTIVE: stores the generated word
# written by Matt Cloyd
# started September 15 2012, alpha finished 
#

# WordController
#	PRIME DIRECTIVE: manipulates the word
#	can rewrite words based on rules, make changes, store in history
#	uses generate.rb
#	functions like add_after(letters, substring position in front of which to insert)
#	functions like replace_multiples_at, which takes in a letter and a position and a number,
	# replaces all repeated instances at that position, replaces with a multiple of the
	# given letter => easy if you have the letter array, loop through array, adding lengths til
	# you know you're in the set that you want, check by comparing letter to la[x][1]
	# then just a la[x] = some.times puts "x"
	
#	opening_of_branch_closed_at
#	opening_of_branch_at
#	closing_of_branch_closed_at
#	closing_of_branch_at



# TODO
# Change while loops to for loops with end conditions of length to end
# the possibility of endless loops, and to add the possibility that you're
# not inside a branch

class WordController
	
	attr_reader :word
	
	def initialize(word)
		@word = word
	end
	
	def rotate_branch(branch, )
		
	end
	
	def tally_brackets(cursor)
		if @word.word[cursor..cursor] == "["
			@open_brackets += 1
		elsif @word.word[cursor..cursor] == "]"
			@close_brackets += 1
		end
		puts "@open_brackets = " + @open_brackets.to_s + " | @close_brackets = " + @close_brackets.to_s
	end
		
	def get_branch_at(string_position)
		# I AM THE NEXT STEP, WRITE ME
		# Given a position in the word, returns the location of
		# the open bracket and the closed bracket of the branch that
		# contains that position.
		@cursor = string_position
		
		@open_brackets = 0
		@close_brackets = 0
		
		# If it is an open bracket
		if @word.word[ @cursor ] == "["
		puts "WordController#get_branch_at - open bracket"
			# Add 1 to open_brackets_counter
			@open_brackets = 1
			# Step forward, counting open and closed brackets until
			# open_bracket_counter = closed_bracket_counter
			while @open_brackets != @close_brackets
				@cursor += 1
				tally_brackets(@cursor)
			end # while unbalanced
			
			@array = [string_position, @cursor]
			puts "WordController#get_branch_at - open bracket - returns " + @array.to_s
			return @array
			
		end # if starts open
		
		# If it is a closed bracket
		if @word.word[ @cursor ] == "]"
			puts "WordController#get_branch_at - closed bracket"
			# Add 1 to closed_bracket_counter
			@close_brackets = 1
			# Step backward, counting open and closed brackets until
			# open_bracket_counter = closed_bracket_counter
			while @open_brackets != @close_brackets
				@cursor -= 1
				tally_brackets(@cursor)
			end #while unbalanced
			
			@array = [@cursor, string_position]
			puts "WordController#get_branch_at - closed bracket - returns " + @array.to_s
			return @array
						
		end # if starts closed
		
		# If it is neither
		if @word.word[ @cursor ] != "]" and @word.word[ @cursor ] != "["
			puts "WordController#get_branch_at - neither"
			# count backward until open_bracket > closed_brackets
			while @open_brackets <= @close_brackets
				puts "WordController#get_branch_at - neither - while"
				@cursor -= 1
				puts "WordController#get_branch_at - neither - @cursor = #{@cursor}"
				tally_brackets(@cursor)
			end #while
			
			@array = [@cursor]
			@open_brackets = 0
			@close_brackets = 0
			puts @array
			puts "now to the other side, count forward"
			@cursor = string_position

			# then count forward from string_position until closed_brackets > o_b
			while @close_brackets <= @open_brackets
				@cursor += 1
				puts @cursor
				tally_brackets(@cursor)
			end #while
		
			@array << @cursor
			puts "WordController#get_branch_at - neither - returns " + @array.to_s
			return @array	
					
		end #if it is neither
		
	end # get branch at
	
end