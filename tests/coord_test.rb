#coord angle test


class CoordTest < Processing::App


	def setup
		stroke 0
	end
	
	def draw
		background 255
		angle = atan2(mouse_y, mouse_x)
		dist = dist(0, 0, mouse_x, mouse_y)
		line(0, 0, Math.cos(angle)*dist, Math.sin(angle)*dist)
	end

end


move through word
if it happens upon an open, find the close
  make a branch for those two nodes and give the substring to it as a property
if it happens upon a close
  is it already 