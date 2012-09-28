#cyltest
# by MJC

class CylTest < Processing::App

# Test cylinders drawn normally via a module	
	
	load '../models/_cylinder.rb'
	include Cylinder
	
	def setup
	  size 500, 500, P3D
	  background 255
	end
	
	def draw
	  background 255
	  rotate_z(radians(mouse_x))
	  rotate_x(radians(mouse_y))
	  translate 0, 10
	  fill 200, 10, 10
	  cylinder 20, 150, 40, 400
	  translate 200, 200
	  fill 20, 100, 12
	  cylinder 50, 50, 4, 200
	end

# Test cylinders drawn as a branch between two nodes

end