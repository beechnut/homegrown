class TreeController

	include Processing::Proxy
	
	load '../models/tree.rb'
		
	def initialize(word)
		@tree = Tree.new(word)
	end
	
	
	def get_model_point
		return [model_x(0,0,0), model_y(0,0,0), model_z(0,0,0)]
	end
	
	@@unit_length = 60
	@@angle_deg = 20
	
	# DISPLAY CONTROL

	# When it's time to make a new generation or something,
	# this is used. Otherwise, we can stick with simply redrawing the 
	# nodes and lines.
		
	# Reads the word, and represents it visually
	def interpret
		puts " ---------- TreeController#intepret: Interpret begins"
		@open_nodes = []
		@closed_nodes = []
		@orders = []
		@str_pos = 0 # keeps track of where we are in the string, to assign to node
		
		# reads through each letter of the word
		@tree.word.word.split('').each do | letter |
			
			# puts "TreeController#interpret: str_pos: " + @str_pos.to_s
			case letter
				# upon [
				when "["
					# open_branch { opens << new open_node at model(0), closeds << nil }
					pushMatrix
					@open_nodes << Node.new( model_x(0,0,0), model_y(0,0,0), model_z(0,0,0), @str_pos )
					@closed_nodes << nil
					@orders << (@open_nodes.length - @closed_nodes.nitems).to_i
					# puts "TreeController#interpret#case #{letter}"
				# upon ]
				when "]"
					# close_branch { closeds.last-nil << new close_node at model(0) }
					
					def last_nil
						@i = @closed_nodes.length-1
						while @i >= 0 do
							# puts "i = " + @i.to_s
							if @closed_nodes[@i].nil?
								puts "TreeController#interpret: closed_node" + @i.to_s + " is nil"
								break
							end
							@i -= 1
							# puts @closed_nodes.to_s
						end
						# puts "loop ended"
						# puts "the last nil is at index " + @i.to_s
					end
					
					last_nil
					
					@closed_nodes[@i] = Node.new( model_x(0,0,0), model_y(0,0,0), model_z(0,0,0), @str_pos )
					popMatrix
					# puts "TreeController#interpret#case #{letter}"
				when "F"
					translate 0, -@@unit_length
					# puts "TreeController#interpret#case #{letter}"
				when "X"
					translate 0, -@@unit_length/20
					# puts "TreeController#interpret#case #{letter}"
				when "+"
					rotate_z(radians(@@angle_deg))
					# puts "TreeController#interpret#case #{letter}"
				when "-"
					rotate_z(radians(-@@angle_deg))
					# puts "TreeController#interpret#case #{letter}"
				else
					# puts "TreeController#interpret#case: No interpretation available."
			end #case
			
			# Counter for string position
			@str_pos += 1
			
		end # split-do
		
		# branch pairing
		# for each open
		@open_nodes.each_with_index do | node, index |
			# pair it with a closed in a branch
			@tree.add_branch( node, @closed_nodes[index], @orders[index] )
			# puts "    ---  " + index.to_s + "  ---"
			# puts node, @closed_nodes[index], @orders[index]
			# puts ""
		end # open-nodes pairing branches
		
		# move nodes to appropriate arrays
		@open_nodes.each do | node |
			@tree.transfer_node(node)
		end
		
		@closed_nodes.each do | node |
			@tree.transfer_node(node)
		end
		puts "TreeController#interpret: INTERPRET ends ----------"
	end
	
	# Removes all nodes and branches to prepare for an interpretation
	def disintegrate
		@tree.branch_controller.empty
		@tree.node_controller.empty
	end
	
	def draw
		@tree.draw
	end
	
	
	# HISTORY CONTROL
	def goto_previous_generation
		# Ask my history for the previous generation, and become it if there is one
		
	end
	
	def goto_next_generation
		# Ask my history for the next generation, and become it if there is one
	end
	
	def grow_a_generation
		# Grow one more generation: run the word through the rules, and display
	end
	
	
	# MOUSE

	# on mouse click => node controller.mouse click, etc.
	
	$mouse_clicks = 0
	def mouse_clicked
		puts "TreeController#mouse_clicked at (#{mouse_x},#{mouse_y})"
		@now_moving = @tree.node_controller.mouse_clicked
		# get the released node
		@released = if @now_moving.nil?
						@released # returns nil if we've got a node in focus
					else
						@now_moving # returns the index of the node in @nodes if released
					end
		
		# get the angle between the released node and its partner in the branch
		@released_node = @tree.node_controller.nodes[@released] unless @released.nil?
		puts "released: " + @released_node.to_s
		@angle_to_write = @tree.branch_controller.angle( @released_node ) unless @released_node.nil? #degrees
		
		#match to pass to update angle
		@match = @tree.branch_controller.find_match_of( @released_node )
		@tree.history_controller.add_modification( @tree.word_controller.update_angle( degrees(@angle_to_write), @released_node, @match, @@angle_deg ) ) unless @released_node.nil?
		
		$mouse_clicks += 1
		if $mouse_clicks % 2 == 0
		  disintegrate
		  interpret
		end
		
		redraw
	end

	def mouse_moved
		#puts "TreeController#mouse_moved"
		@tree.node_controller.mouse_moved
	end
	
	def mouse_dragged
		#puts "TreeController#mouse_dragged"
		@tree.node_controller.mouse_dragged
	end
	
	def advance_generation
		puts "TreeController#advance_generation"
		@tree.word = @tree.history_controller.advance_generation(@tree.rules)
		puts "TreeController#advance_generation: word:" + @tree.word.word.to_s
	end
	
	def regress_generation
		puts "TreeController#regress_generation"
		@tree.word = @tree.history_controller.regress_generation
		puts "TreeController#regress_generation: word:" + @tree.word.word.to_s
	end
	
	
end