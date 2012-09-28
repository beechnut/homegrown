#!/usr/bin/ruby

#CylinderTest
# by MJC


class CylinderTest < Processing::App

	load '../controllers/branch_controller.rb'
	load '../controllers/node_controller.rb'
	
	require 'Cylinder.rb'
	include Cylinder
	
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