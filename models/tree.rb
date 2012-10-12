#
# Tree (model)
# written by Matt Cloyd (beechnut)
# 

#
# A tree has a
#		- word
#		- rules
#		- history
#		- appearance
#			- branches
# 		- nodes
#			- trunk_width 
#			- contraction_ratio

class Tree

	# Word
	
	load '../models/word.rb'
	load '../controllers/word_controller.rb'	
	
	# Rules, because the TREE stores the rules. It's inherent.
	
	load '../rule_classes.rb'
	
	# History

	load '../models/history.rb'
	load '../controllers/history_controller.rb'

	# Nodes
	
	load '../models/node.rb'
	load '../controllers/node_controller.rb'
	
	# Branches
	
	load '../models/branch.rb'
	load '../controllers/branch_controller.rb'
	
	
	
	attr_accessor :trunk_width, :contraction_ratio, :word, :node_controller, :branch_controller, :word_controller, :history_controller
	attr_reader :rules
	
	def initialize(word)
		# - word
		@word = Word.new(word)
		@word_controller = WordController.new(@word)
		# - rules
		@a = Rule.new( nil, nil, "X", nil, 1, "F[+X]F[-X]X" )
		@b = Rule.new( nil, nil, "F", nil, 1, "FF" )
		@rules = [ @a, @b ]
		# - history
		@history = History.new(@word)
		@history_controller = HistoryController.new(@history)
		# - appearance
		@node_controller = NodeController.new
		@branch_controller = BranchController.new
		@trunk_width = 5
		@trunk_increment = 3
		@contraction_ratio = 0.7
	end
	
	def draw
		@branch_controller.draw_branches(@trunk_width, @trunk_increment, @contraction_ratio, @history_controller.n.to_i)
		@node_controller.draw_nodes
	end
	
	def add_branch(start_node, end_node, order=0)
		@branch_controller.add_branch(start_node, end_node, order)
	end
	
	def transfer_node(node)
		@node_controller.transfer_node(node)
	end
	
	def add_node
		@node_controller.add_node( model_x(0,0,0), model_y(0,0,0), model_z(0,0,0) )
	end
	
	def update_angle( angle, node )
		@word_controller.update_angle( angle, node )
	end

end 