class BranchController
	
	load '../models/branch.rb'
	
	def initialize
		@branches = []
	end
	
	def add_branch(node1, node2, order=0)
		@branches << Branch.new(node1, node2, order)
	end
	
	def draw_branches
		@branches.each do |branch|
			branch.draw_as_line
		end
	end
	
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
	
	def angle(node)
		
	end
	
end