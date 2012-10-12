class BranchController

	include Processing::Proxy
	
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

	# remap the normal position of angles 0 = West = left to 0 = North = up
	def north(deg)
		if deg > 0
			mapped = map(deg, 0, 180, -90, 90)
		elsif deg < 0 and deg >= -90
			mapped = map(deg, 0, -90, -90, -180)
		elsif deg < 0 and deg < -90
			mapped = map(deg, -90, -180, 180, 90) 
		end
	end # north
	
	# get the other node in the branch
	def find_match_of(node)
		# gets the other node in the branch that contains the passed-in node
		@branches.each do |branch|
			if branch.start_point == node
				return branch.end_point
			elsif branch.end_point == node
				return branch.start_point
			else
				# puts "BranchController#find_match_of(node): could not find the node in any branch"
			end # conditional
		end # each do
	end # find match of
	
	# returns degrees between a node and its pair
	def angle(node)
		@node1 = find_match_of(node)
		@node2 = node
		#puts "BranchController#angle: @node1 = " + @node1.to_s
		#puts "BranchController#angle: @node2 = " + @node2.to_s
		unless @node1.class == Array
			angle = Math.atan2( @node2.node_y - @node1.node_y, @node2.node_x - @node1.node_x )
			remapped = north(degrees(angle))
			#puts "BranchController#angle (remapped): " + remapped.to_s
			return remapped
		end
	end
	
end