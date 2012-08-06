# Set it so we can add booleans
class TrueClass; def to_i; 1; end; end
class FalseClass; def to_i; 0; end; end

# RuleDice module
# Pull in if there's a less<100% chance of a subindex=0 rule being activated
module Probable

	# pass in a rule, get its probability, check, return
	def roll
		if rand < prob
			return pred
		else
			return ""
		end
	end

end # Probable module

# ProbabilitySubrules module
# chooses which of many subrules to run

# REALLY HASH IT OUT, YOU'RE CLOSE
module SubruleChooser

	def choose  #called on a rule

		@statement = "case rand; "
		@first = 0
		@last = @subrules.length-1
		
		@subrules.each_with_index do |rule, index|
			puts rule
			if index == @first
				@statement << "when 0..#{rule.prob} : return @subrules[#{index}]; "
				@lastprob = rule.prob
			elsif index == @last
				@statement << "when #{@lastprob}..1 : @subrules[#{index}]; "
			else
				@statement << "when #{@lastprob}..#{@lastprob + rule.prob} : @subrules[#{index}]; "
				@lastprob = rule.prob
			end
		end
		
		@statement += "else return nil; end;"
		puts @statement
		
		# run it
		eval(@statement)
		
	end # choose

end # SubruleChooser module


#
# Rule Classes
# rule_classes.rb
# by Matt Cloyd (August 2012)
#

#
# Features:
#
# - Creates and handles rules according to L-System definitions.
# - Gets the rule to determine its own predecessor regex and successor
#   based on its characteristics like probability and context-sensitivity.
# - Handles logic of rules being in the list, and prepares them for display.
#




### STATE OF NLSYSTEM MODULES
###  No probability for One and Two, please add
###  Does not address bracket skipping anywhere

# Modules of rules, depending on context
      # zero, not letter "O"
module ZeroLSystemRule

	include Probable
	include SubruleChooser

	
	# how to produce the predecessor regex for an 0LSystemRule	
	def active_predecessor
		#if there are no subrules
		if @subrules.nil?
			# if the probability of the rule is less than 1
			if prob < 1
				# roll to find out the result, which will be pred or ""
				$result = self.roll
				return $result
			else
				$result = pred
				return $result
			end
		elsif !@subrules.nil? #if subrules are not empty
			#set the chosen rule as an instance variable
			$chosen_rule = self.choose
			#return the chosen rule's predecessor
			return $chosen_rule.pred
		end # number of subrules conditional
	end # active predecessor
	
	
	# how to produce the successor regex for an 0LSystemRule
	def active_successor
		
		# if there are no subrules
		if @subrules.nil?
			# if the module returns a blank predecessor, return a blank successor
			if $result.empty?
				return ""
			# otherwise return the regular successor
			else
				return succ
			end
		elsif !@subrules.nil?
			return $chosen_rule.succ
		end #subrules number conditional
	end # active successor
	
end # ZeroLSystemRule


module OneLSystemRule
	def active_predecessor
		return lcon.nil? ? rcon + pred : lcon + pred
	end
	
	def active_successor
		return lcon.nil? ? rcon + succ : lcon + succ
	end
end

module TwoLSystemRule
	def active_predecessor
		return lcon + pred + rcon
	end
	
	def active_successor
		return lcon + succ + rcon
	end
end



# Both ILSystemRule and PLSystemRule are based off of OLSystemRule, 1LSystemRule, 2LSystemRule

class ILSystemRule
	def initialize
	end
end

class PLSystemRule
	def initialize
	end
end




class Rule

	attr_accessor :index, :subindex, :lcon, :pred, :rcon, :prob, :succ
	
	# rule and ILSystemRule will do the same thing until I figure out the difference
	#  between an ILSystemRule and Parametric PLSystemRule
	# all rules have index, subindex, predecessor, probability, successor
	# some rules have left context, right context, or left and right context
	
	# arguments that aren't contexts will be assigned as nil in the app and passed here
	def initialize ( subrules, lcon, pred, rcon, prob, succ )
		@subrules, @lcon, @pred, @rcon, @prob, @succ =  subrules, lcon, pred, rcon, prob, succ
		
		# Check for conditions passed it
				   # if it's not nil, add 1, if it is nil, add 0
		context_count = (!lcon.nil?).to_i + (!lcon.nil?).to_i

		# If it has only left or right context
		if context_count == 1
			extend OneLSystemRule
		# Else if it has both left and right context
		elsif context_count == 2
			extend TwoLSystemRule
		# Else if it has no context
		elsif context_count == 0
			extend ZeroLSystemRule
		else
			# raise error
			puts "You don't have 0, 1, or 2 contexts, but #{context_count}."
		end # conditional about context_count

		# eventually make recursive with a base case of subrules=0, other cases
		def chosen_rule
			unless self.subrules.nil?
				###########################
				# 
				# TODO build case/switch to return one subrule( Rule object )
				#  aka multiprob module
				return chosen
			else
				return self
			end
		end

		def run
			return chosen_rule.active_predecessor, chosen_rule.active_successor
		end	

	end # initialize

end # Rule class





class RuleList < Array

	# Adds a rule to the list	
	def add( rule ) #where does this get called?
		self << rule
	end
	
	# Removes a rule from the list
	# Re-indexes the list (maintains the subindices, but all indices
	#  greater than the one removed are decremented
	def destroy( index )
		delete_at( index )
	end
	
	### Methods that interface with RuleDisplay in the Shoes app
	###
	
end # RuleList

