module Pannable	
	def mouse_dragged
	  dist_x = pmouse_x - mouse_x
	  dist_y = pmouse_y - mouse_y
	  @cam_x += dist_x
	  @cam_y += dist_y
	  
	  camera(@cam_x, @cam_y, (height/2) / tan(PI/6), 
			 @cam_x, @cam_y, 0, 
			0, 1, 0) # moves with mouse, drag/pan
	end
end

class Coordination < Processing::App
	
	#include Pannable
		
	def setup
	  size 640, 360, P3D
	  @cam_x = width/2
	  @cam_y = height/2
	end
	
	def draw
	  background 0
	  translate width/2, height/2, -100 
	  stroke 255
	  no_fill
	  box 200
	end
	
	def mouse_dragged
	  dist_x = pmouse_x - mouse_x
	  dist_y = pmouse_y - mouse_y
	  @cam_x += dist_x
	  @cam_y += dist_y
	  
	  camera(@cam_x, @cam_y, (height/2) / tan(PI/6), 
			 @cam_x, @cam_y, 0, 
			0, 1, 0) # moves with mouse, drag/pan
	end

end


