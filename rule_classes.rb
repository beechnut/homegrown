# Set it so we can add booleans
class TrueClass; def to_i; 1; end; end
class FalseClass; def to_i; 0; end; end

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

class RuleList
	
	# attr_accessor

	def initialize
	end

	# Adds a rule to the list	
	def add 
	end
	
	# Removes a rule from the list
	# Re-indexes the list (maintains the subindices, but all indices
	#  greater than the one removed are decremented
	def destroy( index )
		rule = self[ index ] # Gets the rule and destroys it
	end
	
	# Sorts a list by index and subindex, for display
	def sort
		# Sorts by index, then subindex
	end
	
	### Methods that interface with RuleDisplay in the Shoes app
	###
	
end




# Modules of rules, depending on context
      # zero, not letter "O"
module 0LSystemRule
	def active_pred
	end
	
	def active_succ
	end
end

module 1LSystemRule
def active_pred
	end
	
	def active_succ
	end
end

module 2LSystemRule
	def active_pred
	end
	
	def active_succ
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



# Rules with 100% probability have their regex simply declared
# Otherwise, rules with less than that are run to determine the pred regex and succ

class Rule
	
	# rule and ILSystemRule will do the same thing until I figure out the difference
	#  between an ILSystemRule and Parametric PLSystemRule
	# all rules have index, subindex, predecessor, probability, successor
	# some rules have left context, right context, or left and right context
	
	# arguments that aren't contexts will be assigned as nil
	def initialize ( index, subindex, lcon, pred, rcon, prob, succ )
		#@index, @subindex, @lcon, @pred, @rcon, @prob, @succ =  index, subindex, lcon, pred, rcon, prob, succ
		
		# Check for conditions passed it
				   # if it's not nil, add 1, if it is nil, add 0
		context_count = (!lcon.nil?).to_i + (!lcon.nil?).to_i

		# If it has only left or right context
		if context_count == 1
			extend 1LSystemRule
		# Else if it has both left and right context
		elsif context_count == 2
			extend 2LSystemRule
		# Else if it has no context
		elsif context_count == 0
			extend 0LSystemRule
		else
			# raise error
			puts "You don't have 0, 1, or 2 contexts, but #{context_count}."
		end # conditional about context_count

	end # initialize
	
	def increment_index
	end

	def decrement_index
	end
	
	
end

