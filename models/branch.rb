class Branch

	include Processing::Proxy
	attr_reader :start_point, :end_point
	require '../models/node.rb'
	require '../controllers/node_controller.rb'

	
	# function Cylinder(n, r1, r2, h)
	def cylinder( sides, r1, r2, h )
		angle = 360 / sides
		half_height = h / 2
		
		# top
		img = PImage.new
		img = load_image('../models/stone.jpg')
		#texture_mode(NORMALIZED)
		begin_shape
		texture(img)
		for i in 0..sides
			x = cos( radians( i * angle ) ) * r1
			y = sin( radians( i * angle ) ) * r1
			vertex( x, y, -half_height)
		end
		end_shape(CLOSE)
		
		# bottom
		begin_shape
		texture(img)
		for i in 0..sides
			x = cos( radians( i * angle ) ) * r2
			y = sin( radians( i * angle ) ) * r2
			vertex( x, y, half_height)
		end
		end_shape(CLOSE)
		
		# draw body
		begin_shape(TRIANGLE_STRIP)
		texture(img)
		for i in 0..sides
			x1 = cos( radians( i * angle ) ) * r1
			y1 = sin( radians( i * angle ) ) * r1
			x2 = cos( radians( i * angle ) ) * r2
			y2 = sin( radians( i * angle ) ) * r2
			vertex( x1, y1, -half_height)
			vertex( x2, y2, half_height)
		end
		end_shape(CLOSE)
	end
	
	# function CylinderBetween(node, node)
		# get angle between nodes (atan), push - rotate to atan - 1pop
	def cylinder_between(node1, node2, trunk_width, trunk_increment, contraction_ratio, gen)
		x1 = node1.node_x
		y1 = node1.node_y
		x2 = node2.node_x
		y2 = node2.node_y
		
		dy = x2-x1
		dx = y2-y1
		
		angle = -atan2(dy, dx)
		
		dist = dist(x1, y1, x2, y2)
		
		pushMatrix
			translate x1+((x2-x1)/2), y1+((y2-y1)/2)
			# rotate to atan
			rotate_x(radians(90))
			rotate_y(angle)

			#puts "Branch#cylinder_between: gen = " + gen.to_s
			@sides = 35
			@sides = 35 / gen unless gen == 0
			@r1 = (trunk_width + gen * trunk_increment)/(@order+1)
			@r2 = (trunk_width + gen * trunk_increment)/(@order)
			cylinder(@sides, @r1, @r2, dist)
		popMatrix
	end
	
	
	def initialize( node1, node2, order = 0 )
		@start_point = node1
		@end_point = node2
		@order = order
	end
	
	def draw_as_line
		pushStyle
			stroke 0, 0, 0
			stroke_weight 2
			line(@start_point.node_x, @start_point.node_y, @start_point.node_z, @end_point.node_x, @end_point.node_y, @end_point.node_z)
		popStyle
	end
	
	def draw_as_cylinder(trunk_width, trunk_increment, contraction_ratio, gen)
		pushStyle
			no_stroke
			fill 197, 194, 191
			cylinder_between(@start_point, @end_point, trunk_width, trunk_increment, contraction_ratio, gen)
		popStyle
	end
	

end