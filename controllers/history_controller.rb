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

	attr_reader :generations, :modifications, :n
		
	require '../generate.rb'
	require '../models/word.rb'
	
	# Call this controller on a history to get control of it.
	def initialize(history)
		@generations = history.generations
		@modifications = history.modifications
		@n = 0
		
		puts "history.generations: " + history.generations.to_s
		puts "history.generations[0].word: " + history.generations[0].word.to_s
		puts @generations.length
		puts "index " + @n.to_s + " of a max " + (@generations.length-1).to_s + " (length " + (@generations.length).to_s + ")"
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
		return @generations[n]
	end
	
	# MODIFICATIONS[]
	
	# add word to modifications
	def add_modification(word)
		@modifications[@modifications.length-1] = word
	end
	
	# replace word
	def replace_modification(replacement_word, n)
		@modifications[n] = replacement_word
	end
	
	# read modification from modifications
	def get_modification(n)
		return @modifications[n]
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
			mod_print = @modifications[n].to_s
			puts "gen: " + n.to_s + " - " + gen.word.to_s + " | mod: " + mod_print
		end
	end
	
	
	### Returnable: Is there a modification? If so, return mod, else return gen
	def returnable
		if get_modification(@n).nil?
			# puts "HistoryController#returnable: no modifications, so the generation was returned"
			return get_generation(@n)
		else
			# puts "HistoryController#returnable: modification was returned"
			return get_modification(@n)
		end
	end
	
	
	
	#### AGE ADVANCEMENT
	def advance_generation(rules)
	  #puts "HistoryController#advance_generation"
	  # if this is the last generation
	  if @n == @generations.length-1
	  	# take the word and generate it into the next generation
	  	# add_generation(Word.new("hi")) # this works, meaning it's a namespacing issue
	  	add_generation(Word.new(generate(returnable, rules, 1))) #should be accessing with .word
	  	# add_generations is apparently replacing all entries with new word
	  end
	  # we move forward in the array
	  @n +=1
	  $generation = @n
		#puts "index " + @n.to_s + " of a max " + (@generations.length-1).to_s + " (length " + (@generations.length).to_s + ")"
		print_history
		return returnable
	end
	
	def regress_generation
		#puts "HistoryController#regress_generation"
		# if this is the first generation
		if @n == 0
			# puts that it's the first generation
			#puts "HistoryController#regress_generation says: We're at the first generation. Can't go back."
			return returnable # returns @n=0
		# else if this is not the first generation
		else
			# move back a generation (n-=1)
			@n -= 1
			$generation = @n
			# puts "index " + @n.to_s + " of a max " + (@generations.length-1).to_s + " (length " + (@generations.length).to_s + ")"
			print_history
			return returnable
		end # conditional regression
		
	end
	

end