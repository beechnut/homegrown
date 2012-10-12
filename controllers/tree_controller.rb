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
								# puts "TreeController#interpret: closed_node" + @i.to_s + " is nil"
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
	def mouse_clicked
		puts "+"
		puts "+"
		puts "+"
		puts "TreeController#mouse_clicked at (#{mouse_x},#{mouse_y})"
		
		# get held and released nodes
		@hash = @tree.node_controller.mouse_clicked # TODO => update NodeController#mouse_clicked
		@held = @hash['held']
		@released = @hash['released']

		# if held is nil
		if @held.nil? and @released
			puts "TreeController#mouse_clicked @held: #{@held}, @released: #{@released}"
			# calculate angle based on remapped north
			@angle_to_write = @tree.branch_controller.angle( @released ) #returns as remapped degrees
			# get matching node to pass to update angle, so it can find the right string positions
			@match = @tree.branch_controller.find_match_of( @released )
		  # update word with angle
		  puts "TreeController#mouse_clicked: RETURNABLE = " + @tree.history_controller.returnable.word.to_s
		  @tree.history_controller.add_modification( @tree.word_controller.update_angle( @angle_to_write, @released, @match, @@angle_deg, @tree.history_controller.returnable ) )
		  @tree.word = @tree.history_controller.returnable
		  # set @released to nil so a click elsewhere doesn't F everything up
		  @released = nil
		  puts "TreeController#mouse_clicked: @released should be nil and it is " + @released.to_s
		  puts "TreeController#mouse_clicked: @held should be nil and it is " + @held.to_s
		  # disintegrate; interpret
		  disintegrate
		  interpret
		end
		redraw
	end # mouse_clicked

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