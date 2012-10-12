# Atan2 Range Test
# Testing the domain, range, and adjustability of atan2()


class AtanTwoRangeTest < Processing::App
	
	# remap the normal position of angles 0 = West = left to 0 = North = up
	def north(deg)
		if deg > 0
			mapped = map(deg, 0, 180, -90, 90)
		elsif deg < 0 and deg >= -90
			mapped = map(deg, 0, -90, -90, -180)
		elsif deg < 0 and deg < -90
			mapped = map(deg, -90, -180, 180, 90) 
		end
	end # north
	
	# draw a line | calculate the angle and its remapping
	def draw
		frame_rate 10
		background 0
		stroke 255
		stroke_weight 2
		dx = width/2 - mouse_x
		dy = height/2 - mouse_y
		line(width/2, height/2, mouse_x, mouse_y)
		
		angle = atan2(dy, dx)
		#puts "angle in radians" + angle.to_s
		deg = degrees(angle)
		puts "degrees(angle) " + deg.to_s
		
		mapped = north(deg)
		puts "mapped = " + mapped.to_s
	end # draw
	
	
end