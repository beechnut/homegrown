#
# Tree (model)
# written by Matt Cloyd (beechnut)
# 

#
# A tree has a
#		- word
#		- history
#		- appearance
#			- branches
# 		- nodes
#			- trunk_width 
#			- contraction_ratio

class Tree

	# Word
	
	load 'models/word.rb'
	load 'controllers/word_controller.rb'	
	
	# History

	load 'models/history.rb'
	load 'controllers/history_controller.rb'
	
	# Branches
	
	load 'models/branch.rb'
	load 'controllers/branch_controller.rb'
	
	
	attr_accessor :trunk_width, :contraction_ratio
	
	def initialize(word)
		# - word
		@word = Word.new(word)
		@word_controller = WordController.new(@word)
		# - history
		@history = History.new(@word)
		# - appearance
		@node_controller = NodeController.new
		@branch_controller = BranchController.new
		@trunk_width = 30
		@contraction_ratio = 0.7
	end
	
	def draw
		# Draw
			# Draw nodes
			# Draw branches with display options (start as line, then cyl, then textured cyl)
	end
	
	def add_branch(start_point, end_point)
		@branch_controller.add_branch(start_point[0], start_point[1], start_point[2], end_point[0], end_point[1], end_point[2])
	end
	
	def add_node
		@node_controller.add_node( model_x(0,0,0), model_y(0,0,0), model_z(0,0,0) )
	end

end 