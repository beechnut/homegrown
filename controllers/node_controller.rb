class NodeController

	include Processing::Proxy  # A proxy mixin lets you use Processing methods

	load '../models/node.rb'
	
	attr_reader :nodes
	
	def initialize
		# Initialize the array of nodes
		@nodes = []
		
		# No node is being moved upon setup.
		@now_moving = nil # TODO: DELETE THIS
		
		@held = nil
		@released = nil
		
		# Set a variable that stores how large each node is drawn
		@node_size = Node::get_node_size
		puts "NodeController#initialize: @nodes = " + @nodes.to_s + ", @now_moving = " + @now_moving.to_s + ", @node_size = " + @node_size.to_s
	end
	
	# Add node
	def add_node(x, y, z, str_pos)
		@nodes << Node.new(x, y, z, str_pos)
		#puts "NodeController#add_node: Added a node!"
	end
	
	# Empty out the array
	def empty
		@nodes = []
	end
	
	def transfer_node(node)
		@nodes << node
	end
	
	# Draw Nodes
	# Draw all nodes, highlighting the one that's being moved, if any
	def draw_nodes
		#puts "NodeController#draw_nodes"
		@nodes.each_with_index do |node, ind|
			if ind == @now_moving
				node.highlight
			else
				node.draw
			end
		end
	end
	
	# Draw Lines Between Nodes
	# draw lines between all the nodes
	#def draw_lines
	#	@nodes.each_with_index do |node, index|
	#		unless index == 0
	#			stroke 100
	#			stroke_weight 2
	#			line(@nodes[index-1].node_x, @nodes[index-1].node_y, node.node_x, node.node_y)
	#			puts " a line"
	#		end
	#	end
	#end
	
	# Mouse Click on a node becomes the moving node, or releases it
	# 
	def mouse_clicked
		#puts "NodeController#mouse_clicked"
		#loop through nodes
		@nodes.each do |node|
			#puts "NodeController#mouse_clicked: node " + node.to_s + " at (" + node.node_x.to_s + ", " + node.node_y.to_s + ")"
			# if a node was clicked when no node is @held
			#puts node
			if @held.nil? and dist(mouse_x - width/2, mouse_y - height + 20, node.node_x, node.node_y) < @node_size
				#puts "NodeController#mouse_clicked: @held.nil? and dist<node_size"
				# @held = clicked object
				@held = node
				#puts @held
				#puts "both if"
				break
			# elsif a click happened while a node is @held
			elsif @held
				#puts "and else"
				#puts "NodeController#mouse_clicked: elsif @held, trying to release the node"
				@released = @held
				@held = nil
				break
			end # conditional 
		end # each do
		# return hash of @held, @released
		#puts "NodeController#mouse_clicked Return Values:"
		#puts @held, @released
		#puts "---------"
		@released = nil if @nodes.index(@released).nil?
		return { "held" => @held, "released" => @released }
	end
	
	# Mouse moved
	#
	def mouse_moved
		unless @held.nil?
			# move it with the mouse, kind of, i mean it should work
			@held.node_x += (mouse_x - pmouse_x)  # DON'T USE THIS IN FINAL, constrain to length
			@held.node_y += (mouse_y - pmouse_y)  # DON'T USE THIS IN FINAL, constrain to length
			# ACTUALLY: atan_of_opening_of_branch_closed_by(@nodes[@now_moving]).to_i.times do puts rotation literal
		end #unless
	end #mouse_moved
	
	
	# drawing options between nodes
	
end