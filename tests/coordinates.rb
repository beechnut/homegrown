# Coordinates
	
class Coordinates < Processing::App
	
	def setup
		size 640, 360, P3D
		fill 204
		rect_mode CENTER
		@a = 0
	end
	
	def draw
	
		lights
		background 0
		
		# Draw a flat plane, that the camera is looking kind of at from above
		camera( mouse_x - width/2, 400.0, 300,
			   0.0, 0.0, 0.0,
			   0.0, 1.0, 0.0)
		
		no_stroke
		rect 0, 0, 120, 120
		translate 0, 0, 45
		box 90
		stroke 255
		line -100, 0, 0, 100, 0, 0
		line 0, -100, 0, 0, 100, 0
		line 0, 0, -100, 0, 0, 100
		
		# Draw a set of axes, red (x), green (y), blue (z)
		
		# Move the camera around them using automatic rotation around the point
		
		# Move the camera around them using dragging
		
		
		
	end

end