# 
# Stochastic.rb
# 
# Develops a set of 
# 
# 

@axiom = "FFffFf"


@rule1 = {"pred" => "F", "succ" => "Ff"}
@rule1 = [@rule1]

@rule2a = {"prob" => "50", "pred" => "f", "succ" => "ff"}
@rule2b = {"prob" => "50", "pred" => "f", "succ" => "A"}
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



def reset_word
	# reset the word = axiom
	@word = @axiom
end

def reset_seed
	# seed reset
	srand 1234
end

def reset_all
	reset_word
	reset_seed
	return "reset word and seed"
end

# Loop through, printing rules based on probabilities

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





class Word

	attr_accessor :axiom, :production_set, :word, :n
	
	def initialize(w, p, n)
		@axiom = w.axiom
		@production_set = p
		@n = n
	end

	

	# Generating a word from an ordered hash
	def gen
		
		# Start it up and let people know
		puts "Generating L-System word with axiom \"#{@axiom}\" and production set #{@production_set.inspect} #{@n} times"
		
		# Assign word to be the axiom
		@word = @axiom
		
		# For each iteration, 1 to n (user-defined)
		for iteration in 1..n
			
			# Loop through each of the rule
			@production_set.each do | entry |
				# For each rule, 
				entry.each_pair do | pred , succ |
					# Replace predecessors with successors
					@word = @word.gsub( pred, succ )
				end
			end
			puts "      p#{iteration.to_s}: #{@word}"
		end
			  
	  return @word
	end
	
	
end # class Word
