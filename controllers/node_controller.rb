class NodeController

	include Processing::Proxy  # A proxy mixin lets you use Processing methods

	attr_reader :nodes
	
	def initialize
		# Initialize the array of nodes
		@nodes = []
		
		# No node is being moved upon setup.
		@now_moving = nil
		
		# Set a variable that stores how large each node is drawn
		@node_size = Node::get_node_size
		puts "NodeController#initialize: @nodes = " + @nodes.to_s + ", @now_moving = " + @now_moving.to_s + ", @node_size = " + @node_size.to_s
	end
	
	# Add node
	def add_node(x, y, z)
		@nodes << Node.new(x, y, z)
		puts "NodeController#add_node: added a node!"
	end
	
	# Draw Nodes
	# Draw all nodes, highlighting the one that's being moved, if any
	def draw_nodes
		@nodes.each_with_index do |node, ind|
			if ind == @now_moving
				node.highlight
			else
				node.draw
			end
		end
	end
	
	# Mouse Click on a node becomes the moving node, or releases it
	# 
	def mouse_clicked
		# if mouse is clicked and now_moving has no node
		if @now_moving.nil?
			puts "NodeController#mouse_clicked: Moving no node (nil)"
			# run through the nodes and assign it if it's within the node
			@nodes.each_with_index do |node, ind|
				if dist(mouse_x, mouse_y, node.node_x, node.node_y) < @node_size
					@now_moving = ind
				end
				# we're going to have to use screenX to do a comparison of mouse position and node position.
				# set index of node as an instance var, because dragging will never result in a graft/branch-open/branch-close
				# @now_moving = node within so many units of mouse_position
			end
			if @now_moving.nil?
					add_node(mouse_x, mouse_y, 0)
			end
		else # if mouse is clicked and there's a node assigned, release it
			@now_moving = nil
		end
		puts "NodeController#mouse_clicked: now moving node at @nodes[" + @now_moving.to_s + "]"
	end
	
	# Mouse moved
	#
	def mouse_moved
		unless @now_moving.nil?
			# move it with the mouse, kind of, i mean it should work
			@nodes[@now_moving].node_x += (mouse_x - pmouse_x)  # DON'T USE THIS IN FINAL
			@nodes[@now_moving].node_y += (mouse_y - pmouse_y)  # DON'T USE THIS IN FINAL
			# ACTUALLY: atan_of_opening_of_branch_closed_by(@nodes[@now_moving]).to_i.times do puts rotation literal 
		end #unless
	end #mouse_moved
	
	
	# drawing options between nodes
	
end