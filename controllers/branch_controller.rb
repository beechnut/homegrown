class BranchController
	
	load '../models/branch.rb'
	
	def initialize
		@branches = []
	end
	
	def add_branch(node1, node2, order=0)
		@branches << Branch.new(node1, node2, order)
	end
	
	def draw_branches(trunk_width, trunk_increment, contraction_ratio, gen)
		@branches.each do |branch|
			#branch.draw_as_line
			branch.draw_as_cylinder(trunk_width, trunk_increment, contraction_ratio, gen)
		end
	end
	
	def empty
		@branches = []
	end
	
	# get the other node in the branch
	def find_match_of(node)
		# gets the other node in the branch that contains the passed-in node
		@branches.each do |branch|
			if branch.start_point == node
				return branch.end_point
			elsif branch.end_point == node
				return branch.start_point
			end # conditional
		end # each do
	end # find match of
	
	# returns degrees between a node and its pair
	def angle(node)
		@node1 = find_match_of(node)
		@node2 = node
		@angle = Math.atan2( @node2.node_y - @node1.node_y, @node2.node_x - @node1.node_x )
		puts "BranchController#angle: " + @angle.to_s
		return @angle
	end
	
end