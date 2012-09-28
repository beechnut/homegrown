# 
# History and HistoryController
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

	attr_accessor :generations, :modifications
	# When the history is created, initialize it with the axiom.
	# The axiom can simply be the first word that the Imager is allowed to modify.	
	def initialize(axiom)
		@generations = [axiom]
		@modifications = [nil] # to keep the entries in line.
	end
	
end