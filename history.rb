# 
# Word Tracker
# written by Matt Cloyd
# 

# 
# Keeps track of all words and modifications to words during the
# time-based modified growth of plants.
# 
# Basic narrative: Two arrays keep track of generated words and modifications
# made to those words in the manipulation process. The index is the variable
# n in the Lindenmayer description. A timeline accesses the entries to review
# growth through time
#

class History

	def initialize(axiom)
		@generations = [axiom]
		@modifications = [nil]
	end
	
	# GENERATIONS
	# add gen to generations
	def add_gen(word)
		@generations << word
		@modifications << nil
	end
	
	# replace gen
	def replace_gen(replacement_word, n)
		@generations[n] = replacement_word
		@modifications[n] = nil
	end
	
	# read gen from generations
	def get_gen(n)
		return @generations[n]
	end
	
	# MODIFICATIONS
	# add word to modifications
	def add_mod(word)
		@modifications.last = word
	end
	
	# replace word
	def replace_mod(replacement_word, n)
		@modifications[n] = replacement_word
	end
	
	# read modification from modifications
	def get_mod(n)
		return @modifications[n]
	end
	
	# print out all gens
	def print_gens
		@generations.each_with_index do | gen, n |
			puts n.to_s + " - " + gen
		end
	end
	
	# print out all mods
	def print_mods
		@modifications.each_with_index do | mod, n |
			puts n.to_s + " - " + mod
		end
	end
	
	# print total n
	def get_totals
		puts "gens: " + @generations.length-1.to_s
		puts "mods: " + @modifications.length-1.to_s
	end
	
	# print out all gens & mods
	def print_history
		@generations.each_with_index do | gen, n |
			puts "gen: " + n.to_s + " - " + gen + "mod: " + @modifications[n]
		end
	end

end