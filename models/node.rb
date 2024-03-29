# 
# Node (model)
# written by Matt Cloyd
#

# 
# Represents and displays a Node, the base unit of display and manipulation
# for L-Systems in Grooby.
#
# Nodes draw themselves as ovals, are different in appearance 
#

# I don't know how "setup" and "draw" will work when called inside each other. I don't
# know what that interaction will produce or how to resolve it.

class Node
	
	include Processing::Proxy  # A proxy mixin lets you use Processing methods
	attr_accessor :node_x, :node_y, :node_z, :str_pos
	
	# Represents a branchpoint, either initial or terminal.
	# Displays differently pop vs push.
	# Highlights when mouse is moved near.
	# Is draggable, and informs the WordController's insert of rotational characters.
	
	# Set a variable so that all nodes are drawn the same size
	@@node_size = 10
	@@expand = 2
	
	#accessor for node size
	def Node.get_node_size
		@@node_size
	end
	
	def initialize(x, y, z, str_pos)
		@node_x = x
		@node_y = y
		@node_z = z
		@str_pos = str_pos
		#puts "Node#initialize at x = #{@node_x}, y = #{@node_y}, z = #{@node_z}"
		#@node_x = model_x( 0, 0, 0 ) # each node stores its location in
		#@node_y = model_y( 0, 0, 0 ) # the model for later comparison
		#@node_z = model_z( 0, 0, 0 ) # to the mouse for highlighting, etc.
	end
	
	# Draws itself as an ellipse
	def draw
		#puts "Node#draw : #{@node_x}, #{@node_y}"
		#puts "Node#draw: str_pos: " + @str_pos.to_s
		pushStyle
			no_stroke
			fill 40, 50, 70
			ellipse(@node_x, @node_y, @@node_size, @@node_size)
		popStyle
	end
	
	# Draws itself as a yellow ellipse
	def highlight
		pushStyle
			no_stroke
			fill 14, 70, 70
			ellipse(@node_x, @node_y, @@node_size + @@expand, @@node_size + @@expand)
		popStyle
	end

end