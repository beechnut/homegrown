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
		
	
	def interpret
		@open_nodes = []
		@closed_nodes = []
		@orders = []
		
		# reads through each letter of the word
		@tree.word.word.split('').each do | letter |
			
			case letter
				# upon [
				when "["
					# open_branch { opens << new open_node at model(0), closeds << nil }
					pushMatrix
					@open_nodes << Node.new( model_x(0,0,0), model_y(0,0,0), model_z(0,0,0) )
					@closed_nodes << nil
					@orders << (@open_nodes.length - @closed_nodes.nitems).to_i
					puts "TreeController#case #{letter}"
				# upon ]
				when "]"
					# close_branch { closeds.last-nil << new close_node at model(0) }
					
					def last_nil
						@i = @closed_nodes.length-1
						while @i >= 0 do
							puts "i = " + @i.to_s
							if @closed_nodes[@i].nil?
								puts @i.to_s + " is nil"
								break
							end
							@i -= 1
							puts @closed_nodes.to_s
						end
						puts "loop ended"
						puts "the last nil is at index " + @i.to_s
					end
					
					last_nil
					
					@closed_nodes[@i] = Node.new( model_x(0,0,0), model_y(0,0,0), model_z(0,0,0) )
					popMatrix
					puts "TreeController#case #{letter}"
				when "F"
					translate 0, -@@unit_length
					puts "TreeController#case #{letter}"
				when "X"
					translate 0, -@@unit_length/20
					puts "TreeController#case #{letter}"
				when "+"
					rotate_z(radians(@@angle_deg))
					puts "TreeController#case #{letter}"
				when "-"
					rotate_z(radians(-@@angle_deg))
					puts "TreeController#case #{letter}"
				else
					puts "TreeController#interpret: No interpretation available."
			end #case
		end # split-do
		
		# branch pairing
		# for each open
		@open_nodes.each_with_index do | node, index |
			# pair it with a closed in a branch
			@tree.add_branch( node, @closed_nodes[index], @orders[index] )
			puts "    ---  " + index.to_s + "  ---"
			puts node, @closed_nodes[index], @orders[index]
			puts ""
		end # open-nodes pairing branches
		
		# move nodes to appropriate arrays
		@open_nodes.each do | node |
			@tree.transfer_node(node)
		end
		
		@closed_nodes.each do | node |
			@tree.transfer_node(node)
		end
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
	def mouse_clicked
		puts "TreeController#mouse_clicked at (#{mouse_x},#{mouse_y})"
		@now_moving = @tree.node_controller.mouse_clicked
		unless @now_moving.nil?
			@node = @tree.node_controller.nodes[@now_moving]
			@angle = @tree.branch_controller.angle(@node)
			@tree.update_angle(@angle, @node)
		end
	end

	def mouse_moved
		#puts "TreeController#mouse_moved"
		@tree.node_controller.mouse_moved
	end
	
	def mouse_dragged
		#puts "TreeController#mouse_dragged"
		@tree.node_controller.mouse_dragged
	end	
	
	
end