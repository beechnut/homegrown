#!/usr/bin/env ruby

# 
# GOAL: Translate model word to image
# using standard symbols
# 
# To create the model, need
# word
# model alphabet V for DOL systems, which is a hash of models for each of the
# letters and symbols in the word
# turtle-style drawing method
#
#



class Imager < Processing::App


	def setup
		
		size 700, 700, P3D
		color_mode HSB, 360
		background 360, 0, 360, 360
		#smooth
		ellipse_mode(CENTER)
		lights
		fill 100, 250, 360
		stroke_weight 2
		# frame_rate 18
		
		# rotatering
		@x_rotation_angle = 0
		@y_rotation_angle = 0
		@xdrag = 0
		@ydrag = 0
		
		#parameters
		@word = "FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X" #ARGV[0].to_s
		@unit_len = 20 #ARGV[1].to_f # unit length
		@angle_deg = 20 #ARGV[2].to_f
		@sublength = 1
				
		#set up the array of words for multiple drawings
		#@word_list = [@word]
		
		load 'models/node.rb'
		load 'controllers/node_controller.rb'
		load 'views/_timeline.rb'
		
		@timeline = Timeline.new
		
		
		# formerly in F:
		def runly(letter)
				case letter
				when "F"
					stroke 40, 100, 100, 60
					line 0, 0, 0, -(@unit_len * @sublength)
					translate 0,-(@unit_len * @sublength)
				when "X"
					stroke 40, 100, 100, 60
					line 0, 0, 0, -(@unit_len * (@sublength/20))
					translate 0, -(@unit_len * (@sublength/20))
				when "+"
					rotateZ(radians(-@angle_deg * @sublength))
				when "-"
					rotateZ(radians(@angle_deg * @sublength))
				when "["
					pushMatrix
					fill 100, 250, 360, 100
					stroke 40, 100, 100, 80
					ellipse 0, 0, 5, 5
					@node_controller.add_node(model_x(0, 0, 0), model_y(0, 0, 0), model_z(0, 0, 0))
					puts "Imager#runly: (push) length: " + @node_controller.nodes.length.to_s
					fill 100, 250, 360
				when "]"
					@node_controller.add_node(model_x(0, 0, 0), model_y(0, 0, 0), model_z(0, 0, 0))
					puts "Imager#runly: (pop) length: " + @node_controller.nodes.length.to_s
					fill 100, 250, 360, 200
					ellipse 0, 0, 10, 10
					popMatrix
				else
					puts "no entry in library"
				end
		end		
		
		
		@alphabet = {"F" => "stroke 40, 100, 100, 60; line(0,0,0,-#{@unit_len * @sublength}); translate(0,-#{@unit_len * @sublength})", # Nodes
					 "f" => "rotateZ(radians(-@angle_deg * @sublength)); no_stroke; ellipse(0,0,10,50)",
					 "A" => "rotateY(radians(-@angle_deg * @sublength)); rotateX(radians(@angle_deg)); no_stroke; ellipse(0,0,10,50)",
					 "[" => "pushMatrix(); fill 100, 250, 360, 100; stroke 40, 100, 100, 80; ellipse(0,0,5,5); fill 100, 250, 360",
					 "]" => "stroke 40, 100, 100, 100; ellipse(0,0,10,10); popMatrix()",
					 	# rotateZ
					 "+" => "rotateZ(radians(-@angle_deg * @sublength))",
					 "-" => "rotateZ(radians(@angle_deg * @sublength))",
					 "|" => "rotateZ(radians(180))",
					 	# rotateY
					 "L" => "rotateY(radians(-@angle_deg * @sublength))", #fix signs
					 "R" => "rotateY(radians(@angle_deg * @sublength))",
					 	# rotateX
					 "&" => "rotateX(radians(-@angle_deg * @sublength))", #fix signs
					 "^" => "rotateX(radians(@angle_deg * @sublength))",
					 
					 "X" => "stroke 40, 100, 100, 60; line(0,0,0,-@unit_len * (@sublength/20)); translate(0,-@unit_len * (@sublength/20))", #"line to" command?
					 
					 "a" => "line(0,0,0,-30 * @sublength); translate(0,-30 * @sublength)",
					 "b" => "rotateZ(radians(90 * @sublength))"
			}

		# make a model out of the letters in setup, then draw that. you can output back to letters later!
		# WORKFLOW: generate plant, modify model, translate back to letters for next iteration!!!!!!!!!!!
		
		#															--------->	 display model  --------.
		#															|																		V
		#									generate word (/time ++)										   modify
		#															^															      |
		#															-----		translate to letters	<-----
		
		
		
		# I'm a moron for not thinking of this sooner, or writing it down. Translation back to letters will require:
		#    o Variable angles (or long strings of angle operators
		#       - Or maybe that's what parametric systems kind of do, but I don't really understand those yet
		#    o Snapping to length-increments, i.e. if length-increment is 2, I can only snap a line to multiples of 2
		
		# MODEL consists of :nodes and :segments between adjacent or child-parent nodes
		# step 1 - make a model that doesn't draw 100 Fs for (100)F, but rather 1 line of 100
		#   make the nodes first by translating and dropping
		#   then have it draw the lines between the nodes
		#   and that's all, all in setup.
		#   ( later you can have draw() redraw the lines between nodes as they move )
		
		translate 300,600
		##############################
		#											 			 #
		#    COMPRESSED EVALUATION   #
		#														 #
		##############################

		# lump find long strings of characters together and evaluate them as one substring
		# this will mean thousands of fewer eval()s called every draw, probably meaning a significantly increased framerate
		# and a base on which to add more functionality like rotations and time
	
		#get the function letter_array
		load 'recur.rb'

		@letter_array = letter_array(@word)
			
		def run
			### Run the model
			# split the word into an array of 'letters'			
			@letter_array.each do |letterset|
				@sublength = letterset.length
				letter = letterset[0..0]
				#puts letterset.to_s + " <word subl> " + @sublength.to_s
				#unless @alphabet[letter].nil?
				#	eval(@alphabet[letter])
				#end
				runly(letter)
			end
		end #run
		
		# CONTINUOUS ROTATION
		@az = 0
		def rotate(bool)
			if bool == "true"
				@az += 5
				rotateY radians(0)
				fill(0, 102, 153);
				text(@az.to_s, 15, 20, 70, 70);
				rotateY radians(@az)
			end
		end
		
		# SET A VIEW
		def camera(position)
				case position
				when :front
					rotateX 0
					rotateY 0
					rotateZ 0
				when :top
					rotateX radians(293)
				when :left
					rotateY radians(94)
				when :orthogonal
					rotateZ radians(45)
					rotateY radians(-45)
				else
				end
		end
		
		
		# RUN
		
		
	end #end setup
	
	###################

	# MAJOR TODO #

	# UI - CONTROLP5 http://www.sojamo.de/libraries/controlP5/#resources
	# TOOLBAR FOR
		# button :front, :left, :top
		# toggle :rotation
		# slider: line length
		# knob: branch angle

	# MOUSE CONTROL
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

	def mouse_rotate
		rotateY radians(@x_rotation_angle)
		rotateX radians(-@y_rotation_angle)
	end
	
	def mouse_clicked
		@node_controller.mouse_clicked
	end
	
	def mouse_moved
		@node_controller.mouse_moved
	end

	###################
	
	# Create node class, object
	#   when it's manipulated, only rotate in increments of angle_unit (1 deg)
	#   find the most recent previous [, append +s or -s depending on direction/quadrant of mouse movement
	#   redraw model ( happens automatically with draw() )
	
	def draw
		@timeline.draw
		@node_controller = NodeController.new
		background 360, 0, 360, 360
		translate 300, 600
		camera(:front)
		rotate("false")
		mouse_rotate
		run
		@node_controller.draw_nodes
	end
	
	def update
	end
	
end