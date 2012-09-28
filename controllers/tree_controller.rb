class TreeController

	include Processing::Proxy
	
	def initialize(tree)
		@tree = tree
	end
	
	
	def get_model_point
		return [model_x(0,0,0), model_y(0,0,0), model_z(0,0,0)]
	end
	
	@@unit_length = 10
	@@angle_deg = 20
	
	# DISPLAY CONTROL

	# When it's time to make a new generation or something,
	# this is used. Otherwise, we can stick with simply redrawing the 
	# nodes and lines.
		
	
	# this case/when tells the elements how to arrange
	# Creates an array of nodes with locations, branch locations
	# the above gets run once in setup, then the nodes are SET FOR GOOD
	# until update(), which clears the nodes out, re-establishes nodes once, redraws
	def arrange_elements(element_char, element_length, current_total)
		# formerly in F:
		case element_char
		
		when "F" # long branch
			# get start of branch
			@start = get_model_point
			# translate
			translate 0, -element_length * @@unit_length
			# get end of branch
			@end = get_model_point
			# add new branch to array of branches
			@tree.add_branch(@start, @end)
		
		when "X" # short branch
			# get start of branch
			@start = get_model_point
			# translate
			translate 0, -element_length * @@unit_length/20
			# get end of branch
			@end = get_model_point
			# add new branch to array of branches
			@tree.add_branch(@start, @end)
		
		when "+" # rotate_z to the left
			# rotate left
			rotate_z(radians(@@angle_deg * element_length))

		when "-" # rotate_z to the right
			# rotate right
			rotate_z(radians(-@@angle_deg * element_length))

		when "[" # start branch
			# pushMatrix
			pushMatrix
			# determine order
			# add new node to array of nodes, and assign sublength
			@tree.add_node
		
		when "]" # close branch
			# add new node to array of nodes
			@tree.add_node
			# popMatrix
			popMatrix
			# determine order
		
		else
			puts "no entry in library"
		end
	end
	
	# Reads the word, updates the display of nodes to reflect it
	def update_display
		@running_total = 0
		# Take word, split into array
		# For each array entry
		@tree.word_controller.split_into_elements.each do | element |
			# Sample the character and get the length
			@element_char = element[0..0]
			@element_length = element.length
			# Run through the case/when
			arrange_elements(@element_char, @element_length, @running_total)
			@running_total += @element_length
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
		puts "TreeController#mouse_clicked"
	end

	def mouse_moved
		puts "TreeController#mouse_moved"
	end
	
	def mouse_dragged
		puts "TreeController#mouse_dragged"
	end	
	
	
end