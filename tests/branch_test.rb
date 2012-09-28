#
# Branch and BranchController Test
#

# Create an array of nodes
# Create an array of branches attached to those nodes
# Draw them so that as you grab them and move them around, the branchlines rotate too

class BranchTest < Processing::App

	load '../controllers/branch_controller.rb'
	load '../controllers/node_controller.rb'
	
	@nc = NodeController.new
	@bc = BranchController.new
	
	def setup
		size 200, 200, P3D
		color_mode HSB, 100
		background 200

		@nc = NodeController.new
		@bc = BranchController.new
		
		# top node set
		@nc.add_node(50, 50, 0)
		@nc.add_node(100, 50, 0)
		@bc.add_branch(@nc.nodes[0], @nc.nodes[1])
		
		#bottom node set
		@nc.add_node(50, 100, 0)
		@nc.add_node(100, 100, 0)
		@bc.add_branch(@nc.nodes[2], @nc.nodes[3])
	end
	
	def draw
		background 200, 10, 90
		@nc.draw_nodes
		@bc.draw_branches
	end
	
	def mouse_clicked
		@a = @nc.mouse_clicked
		@b = @bc.find_match_of(@nc.nodes[@a]) unless @a.nil?
		puts @a.to_s
		@b.highlight
	end
	
	def mouse_moved
		@nc.mouse_moved
	end

end