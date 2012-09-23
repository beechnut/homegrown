# Word
# Word  PRIME DIRECTIVE: stores the generated word
# written by Matt Cloyd
# started September 15 2012, alpha finished 
#

class Word

	load '~/Documents/repos/grooby/models/_recur.rb'
	
	attr_reader :word
	
	# initialize with an input string = word, then split into an array
	def initialize(word)
		@word = word
		@word_array = letter_array(@word)
	end
	
end