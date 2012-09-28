# 
# HistoryController
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

class HistoryController

	attr_reader :generations, :modifications
	
	# Call this controller on a history to get control of it.
	def initialize(history)
		@generations = history.generations
		@modifications = history.modifications
		# will instance variables with the same name have namespacing issues?
	end
	
	# GENERATIONS[]
	
	# add gen to generations
	def add_generation(word)
		@generations << word
		@modifications << nil
	end
	
	# replace gen
	def replace_generation(replacement_word, n)
		@generations[n] = replacement_word
		@modifications[n] = nil
	end
	
	# read gen from generations
	def get_generation(n)
		return @generations[n].to_s
	end
	
	# MODIFICATIONS[]
	
	# add word to modifications
	def add_modification(word)
		@modifications.last = word
	end
	
	# replace word
	def replace_modification(replacement_word, n)
		@modifications[n] = replacement_word
	end
	
	# read modification from modifications
	def get_modification(n)
		return @modifications[n].to_s
	end
	
	
	# REPLACE THE AXIOM
	def replace_axiom(axiom)
		@generations = [axiom]
		@modifications = [nil]
	end
	
	
	# PRINTING
	
	# print out all gens
	def print_generations
		@generations.each_with_index do | gen, n |
			puts n.to_s + " - " + gen.to_s
		end
	end
	
	# print out all mods
	def print_modifications
		@modifications.each_with_index do | mod, n |
			puts n.to_s + " - " + mod.to_s
		end
	end
	
	# print total n
	def get_totals
		puts "gens: " + (@generations.length-1).to_s
		puts "mods: " + (@modifications.length-1).to_s
	end
	
	# print out all gens & mods
	def print_history
		@generations.each_with_index do | gen, n |
			puts "gen: " + n.to_s + " - " + gen.to_s + " | mod: " + @modifications[n].to_s
		end
	end
	
	
	
	#### AGE ADVANCEMENT
	def next_generation_from_generation(n)
	end
	
	def next_generation_from_modification(n)
	end
	

end