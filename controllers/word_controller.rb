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
		@open_brackets = 0
		@close_brackets = 0
	end
	
	def rotate_branch(node_substring)
		# plusses and minuses at the start of an open bracket ONLY
		@pair = get_branch_at(node_substring)
		@node1 = @node_controller.nodes[@pair[0]]
		@node2 = @node_controller.nodes[@pair[1]]
		@angle = atan2()
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
		if @word.word[@cursor..@cursor] == "["
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
			puts "WordController#get_branch_at - open bracket - returns " + @array.join(', ').to_s
			return @array
			
		end # if starts open
		
		# If it is a closed bracket
		if @word.word[ @cursor..@cursor ] == "]"
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
			puts "WordController#get_branch_at - closed bracket - returns " + @array.join(', ').to_s
			return @array
						
		end # if starts closed
		
		# If it is neither
		if @word.word[ @cursor..@cursor ] != "]" and @word.word[ @cursor..@cursor ] != "["
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
			puts "WordController#get_branch_at - neither - returns " + @array.join(', ').to_s
			return @array	
					
		end #if it is neither
		
	end # get branch at
	
	def split_into_elements
		load '~/Documents/repos/grooby/models/_recur.rb'
		return elements_of(@word)
	end
	
	# Updates the substring represented by the node just manipulated
	# to reflect the new angle
	def update_angle( angle, node, match, angle_deg, current_word ) # TODO add param 'word', passed in from tree.hist_control.current_word
																										# word is presently nil class and is causing major errors
		# set new_rotation_char (+,-) based on sign
		@literal = "+"
		
		@pos1 = node.str_pos
		@pos2 = match.str_pos
		# switch positions to make sure that pos1 < pos2 always, so there's a valid range later
		if @pos2 < @pos1
			@pos3 = @pos1
			@pos1 = @pos2
			@pos2 = @pos3
		end
		
		if @pos1 == @pos2
			puts "WordController#update_angle: Well, we're fucked. How are these positions equal?"
		end
		
		#now that @pos1 is definitely the smallest, step forward from there until you hit the first bracket
		@next_bracket = ""
		@pos = @pos1
		#puts "WordController#update_angle: before while"
		while @next_bracket == "" do
			#puts "WordController#update_angle: while"
		  @pos += 1
		  if current_word.word[@pos..@pos] == "[" or current_word.word[@pos..@pos] == "]"
				@next_bracket = @pos
		  end
		  @next_bracket = current_word.word.length-1 if @pos >= current_word.word.length
		  break if @pos > current_word.word.length
		end
		#puts "WordController#update_angle: after while"
		
		if angle > 0
			@literal = "-"
		end
		
		@times = (angle/angle_deg).abs.to_i # determines angle based on angle_deg increment
		puts "times " + @times.to_s
		@rotation_literal_set = ""
		@times.times do
		#puts "WordController#update_angle: times.times do rotation literal set"
			@rotation_literal_set << @literal
		end
		if @rotation_literal_set == ""
			@rotation_literal_set << @literal
		end
				
		#puts "WordController#update_angle: @rotation_literal_set = #{@rotation_literal_set}"
		#puts "WordController#update_angle: @next_bracket = #{@next_bracket}"
		#puts "WordController#update_angle: pos1: " + @pos1.to_s + ", pos2: " + @pos2.to_s
		
		
		# replace any +/- with 
		# regex starting at str_pos for a line of rotation literals +,-, more later
			# replace with angle/system_angle.times do @rotation_string << new_rot_char
		
		#puts "WordController#update_angle: word[range]: " + current_word.word[ @pos1..@next_bracket ].to_s
		current_word.word[ @pos1..@next_bracket ] = current_word.word[ @pos1..@next_bracket ].gsub( /(\++|-+)/, @rotation_literal_set )
		puts "WordController#update_angle CURRENT WORD: " + current_word.word.to_s
		return current_word
	end 	#update angle
	
	
end