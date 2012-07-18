# 
# Generates a production word from an axiom w
# and a set of productions P over n steps and sigma angle.
# 


class Axiom

	attr_accessor :axiom

	def initialize ( w )
		@axiom = w		
	end
	
end



class ProductionSet
	
	attr_accessor :set

	def initialize
		@set = [{'F'=>'Ff'},{'f'=>'f'}]
	end

	def add( hash )
		@set << hash
	end
	
	def list
		@set.each_with_index {|hash, index| puts "      p#{index}: #{hash.inspect}"}
		return 'Done listing'
	end
	
end



class Word

	attr_accessor :axiom, :production_set, :word, :n
	
	def initialize (w, p, n)
		@axiom = w
		@production_set = p
		@n = n
	end

	# Generating a word from an ordered hash
	def gen
		puts "Generating L-System word with axiom \"#{@axiom}\" and production set #{@production_set.inspect} #{@n} times"
		@word = @axiom
		
		for ss in 1..n
			@production_set.each do | entry |
				entry.each_pair do |k,v|
					@word = @word.gsub( k, v )
				end
			end
			puts "      p#{ss.to_s}: #{@word}"
		end
			  
	  return @word
	end
	
end

