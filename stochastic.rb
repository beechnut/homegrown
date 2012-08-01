# 
# Stochastic.rb
# 
# Develops a word based on randomized systems. Resetting the seed
# will replicate the results.
# 

@axiom = "FffF"

@rule1 = {"pred" => "f>f", "succ" => "X"}
@rule1 = [@rule1]

@rule2a = {"prob" => "50", "pred" => "f", "succ" => "ff"}
@rule2b = {"prob" => "50", "pred" => "F>X", "succ" => "A"}
@rule2 = [@rule2a, @rule2b]

@rules = [@rule1, @rule2]



def probable ( random_number, first_prob, second_prob, first_result, second_result )
	case random_number
	when 0..first_prob
		# puts random_number.to_s + " is between 0..0.5, result: " + first_result
		return 0
	when first_prob..second_prob
		# puts random_number.to_s + " is between 0.5..1, result: " + second_result
		return 1
	else
		puts random_number.to_s + "ERROR: not in range"
	end
end



# 
# RESETS
# 

# Resetting the word changes it back to the axiom to start again.
def reset_word
	# reset the word = axiom
	@word = @axiom
end

# Resetting the seed creates deterministic results
def reset_seed
	# seed reset
	srand 1234
end

# Resets both the word and the seed to replicate things.
def reset_all
	reset_word
	reset_seed
	return "reset word and seed"
end


#
# Loop through, printing rules based on probabilities
#

def stochastic
	
	# Loop through rules,
	@rules.each do | rule |

		# Printing rules if they're only 1 subrule long
		if rule.length == 1
			# get predecessors and successors
			@pred = rule[0]["pred"].to_s
			@succ = rule[0]["succ"].to_s
			# replace predecessors with successors
			@word = @word.gsub( @pred, @succ )

		# When there's a rule with two subrules
		elsif rule.length > 1
			# Set probabilities
			first_prob = rule[0]["prob"].to_i
			second_prob = rule[1]["prob"].to_i	+ first_prob
			
			# Set results that print
			first_result = rule[0]["pred"].to_s + "=>" + rule[0]["succ"].to_s
			second_result = rule[1]["pred"].to_s + "=>" + rule[1]["succ"].to_s
			
			# Run a case/switch using the probabilities and pred/successors
			index = probable ( rand(100), first_prob, second_prob, first_result, second_result )
			@pred = rule[ index ]["pred"].to_s
			@succ = rule[ index ]["succ"].to_s
			# gsub using the result from probable
			@word = @word.gsub( @pred, @succ )	
			
		else
			puts "no go"
			
		end

	end # loop
	return @word
end




#
# 
#

def stochastic_context_sensitive
	
	# Loop through rules,
	@rules.each do | rule |

		# Printing rules if they're only 1 subrule long
		if rule.length == 1
			# get predecessors and successors
			@pred = rule[0]["pred"].to_s
			@succ = rule[0]["succ"].to_s
			puts "when get, pred = #{@pred} and succ = #{@succ} and word = #{@word}"
			
		# When there's a rule with two subrules
		elsif rule.length > 1
			# Set probabilities
			first_prob = rule[0]["prob"].to_i
			second_prob = rule[1]["prob"].to_i	+ first_prob
			
			# Set results that print
			first_result = rule[0]["pred"].to_s + "=>" + rule[0]["succ"].to_s
			second_result = rule[1]["pred"].to_s + "=>" + rule[1]["succ"].to_s
			
			# Run a case/switch using the probabilities and pred/successors
			index = probable ( rand(100), first_prob, second_prob, first_result, second_result )
			@pred = rule[ index ]["pred"].to_s
			@succ = rule[ index ]["succ"].to_s
			
		else
			puts "Rule is less than 1 subrule long, aka it doesn't really exist."
			puts "Check what rules you're putting into the array."
			
		end

		# ESSENTIAL MODEL - BUILD PREDECESSORS WITH EARLY CONDITIONALS
		# ALTER RE: CONTEXT
		# THEN GSUB AT END OF LOOP USING BUILT AND ALTERED PREDS
		
		# CONTEXT-SENSITIVITY
		
		#
		# Narrative:
		# 
		# x < y indicates that if x precedes y (xy), the rule is carried out.
		# x > y indicates that if x is preceded by y (yx), the rule is carried out.
		# x < y > z indicates that if y is preceded by x and followed by z,
		#   the rule is carried out.
		#
		# 
		#  w: baaaaaaa
		# p1: b < a -> b  If b precedes a, a becomes b
		# p2:     b -> a  B always becomes a
		# 
		#
		
		# If pred contains only one <,
		if @pred.scan("<").length == 1
			# order the anaphor and antecedent as the predecessor phrase
			@pred = @pred.gsub( /</, "") #shorthand: remove the <
		# else if If pred contains only one >,
		elsif @pred.scan(">").length == 1
			# order anaphor and postcedent as the predecessor phrase
			@pred = @pred.gsub( />/, "").reverse #shorthand: remove the >, reverse
		# Else if pred contains both < and > in that order,
		elsif @pred.scan( /[<>]/ ).length > 2 and @pred.index("<") < @pred.index(">")
			# Get the phrase of three letters as the predecessor
			# Doesn't get the last character yet so the meantime there's a force add
			# Which only captures one character before and not all
			# TODO: FIX THIS
			@pred = @pred.scan( /[A-Za-z](?=[<>])/ ).join("") + @pred[@pred.length-1].chr
		# Else do nothing
		end			
	
		puts "after context, pred = #{@pred} and succ = #{@succ} and word = #{@word}"
		#
		# END CONTEXT-SENSITIVITY CONSTRUCTION ZONE
		#
		# replace predecessors with successors
		@word = @word.gsub( @pred, @succ )	#TODO: MOVE THIS TO BEFORE END#LOOP
		
	end # loop
	return @word
end

# Alias for above function
def scs
	stochastic_context_sensitive
end


