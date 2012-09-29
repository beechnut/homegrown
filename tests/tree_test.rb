# Tree and TreeController Test

# kind of a big deal
# tests whether the tree creates, displays, and is manipulable


class TreeTest < Processing::App

	load '../controllers/tree_controller.rb'
	
	def setup
		size 500, 500, P3D
		color_mode HSB, 100
		@tc = TreeController.new("F[+F[+F]F[-X]F]F")
		@tc.interpret
		no_loop
	end
	
	def draw
		background 66, 20, 95
		pushMatrix
			translate width/2, height-20
			@tc.draw
		popMatrix
	end
	
	def mouse_clicked
		@tc.mouse_clicked
		redraw
	end
	
	def mouse_moved
		@tc.mouse_moved
		redraw
	end

end



# later version will test future, next generations
# gui
# two rects, on mouse clicked move forward, backward a generation