# mousewoop

# rotates an object based on mouse dragging

class MouseWoop < Processing::App

	def setup	
		size 200, 200, P3D
		ellipse_mode(CENTER)
		fill 0
		
		@x_rotation_angle = 0
		@y_rotation_angle = 0
		@xdrag = 0
		@ydrag = 0
		
		def draw_ellipse
			background 255
			translate @width/2, @height/2
			ellipse 0, 0, 100, 100
		end
	end
	
	# gets the motion to apply to rotations
	def mouse_dragged
		@xdrag = mouseX - pmouseX
		@ydrag = mouseY - pmouseY
		@x_rotation_angle += @xdrag
		@y_rotation_angle += @ydrag
	end
	
	# mouse released, resets to 0
	def mouse_released
		@xdrag = 0
		@ydrag = 0
	end
	
	def draw
		rotateY radians(@x_rotation_angle)
		rotateX radians(-@y_rotation_angle)
		draw_ellipse
	end
	

end