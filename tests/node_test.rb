# NodeTest
# makes sure Node and NodeController work as desired


class NodeTest < Processing::App
	
	
	load '../models/node.rb' # Node
	load '../controllers/node_controller.rb' # NodeController


########
########	
	class HLine
		
		def initialize(y, x)
			@y = y
			@x = x
		end
		
		def setup
			stroke 200
			stroke_weight 2
		end
		
		def draw
			line(0, @y, @x, @y)
		end
		
		def highlight
			stroke 200, 10, 20
			stroke_weight 5
			draw
		end
		
	end #HLine
########
########

	def setup
		size 200, 200
		color_mode HSB, 100
		background 200
		@node_controller = NodeController.new
	end
	
	def draw
		background 200
		@node_controller.draw_nodes
	end
	
	def mouse_clicked
		@node_controller.mouse_clicked
	end
	
	def mouse_moved
		@node_controller.mouse_moved
	end
		
end