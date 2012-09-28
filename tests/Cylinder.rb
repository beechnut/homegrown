#!/usr/bin/ruby

#
#
# Cylinder module
# ripped with credit from
#   http:#vormplus.be/blog/article/drawing-a-cylinder-with-processing 
#   http:#processing.org/learning/topics/texturecylinder.html
#
#

module Cylinder

	include Processing::Proxy

	# function Cylinder(n, r1, r2, h)
	def self.cylinder( sides, r1, r2, h )
		angle = 360 / sides
		half_height = h / 2
		
		# top
		#img = load_image("stone.jpg")
		#texture_mode(NORMALIZED)
		begin_shape
		#texture(img)
		for i in 0..sides
			x = cos( radians( i * angle ) ) * r1
			y = sin( radians( i * angle ) ) * r1
			vertex( x, y, -half_height)
		end
		end_shape(CLOSE)
		
		# bottom
		begin_shape
		#texture(img)
		for i in 0..sides
			x = cos( radians( i * angle ) ) * r2
			y = sin( radians( i * angle ) ) * r2
			vertex( x, y, half_height)
		end
		end_shape(CLOSE)
		
		# draw body
		begin_shape(TRIANGLE_STRIP)
		#texture(img)
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
		# get angle between nodes (atan), push-rotate to atan-pop
	
	def self.cylinder_between(node1, node2)
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
			cylinder(20, 50, 10, dist)
		popMatrix
	end
	
		def setup
	  size 500, 500, P3D
	  background 0, 0, 100
	  color_mode(HSB, 100)
	  fill 50, 50, 100, 20
	  stroke 0
	  #translate width/2, height/2
	  #rotate_x(radians(90))
	  
	  @nc = NodeController.new
	  @nc.add_node(200, 200, 0)
	  @nc.add_node(100, 200, 0)
	  
	  @nc.add_node(200, 100, 0)
	  @nc.add_node(100, 100, 0)

	end
	
	def draw
		background 0, 0, 100
		@nc.draw_nodes
		fill 50, 50, 100, 20
		stroke 0
		Cylinder.cylinder_between(@nc.nodes[0], @nc.nodes[1])
		Cylinder.cylinder_between(@nc.nodes[2], @nc.nodes[3])
	end
	
	def mouse_clicked
		@a = @nc.mouse_clicked
	end
	
	def mouse_moved
		@nc.mouse_moved
	end


end