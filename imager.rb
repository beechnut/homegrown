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

# 
# class Something
#	 puts "Input your axiom:"
#	 axiom = gets.chomp
#	 puts "Your axiom: " + axiom
# end
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
		
		#parameters
		@word =  ARGV[0].to_s
		@unit_len = ARGV[1].to_i # unit length
		@angle_deg = ARGV[2].to_f
		@sublength = 1
		
		#  set up the array of words for multiple drawings
		#@word_list = [@word]
		
		# formerly in F:
		$alphabet = {"F" => "stroke 40, 100, 100, 60; line(0,0,0,-#{@unit_len * @sublength}); translate(0,-#{@unit_len * @sublength})", # Nodes
					 "f" => "rotateZ(radians(-@angle_deg)); no_stroke; ellipse(0,0,10,50)",
					 "A" => "rotateY(radians(-@angle_deg)); rotateX(radians(@angle_deg)); no_stroke; ellipse(0,0,10,50)",
					 "[" => "pushMatrix(); fill 100, 250, 360, 100; stroke 40, 100, 100, 80; ellipse(0,0,5,5); fill 100, 250, 360",
					 "]" => "stroke 40, 100, 100, 100; ellipse(0,0,10,10); popMatrix()",
					 	# rotateZ
					 "+" => "rotateZ(radians(-@angle_deg))",
					 "-" => "rotateZ(radians(@angle_deg))",
					 "|" => "rotateZ(radians(180))",
					 	# rotateY
					 "L" => "rotateY(radians(-@angle_deg))", #fix signs
					 "R" => "rotateY(radians(@angle_deg))",
					 	# rotateX
					 "&" => "rotateX(radians(-@angle_deg))", #fix signs
					 "^" => "rotateX(radians(@angle_deg))",
					 
					 "X" => "stroke 40, 100, 100, 60; line(0,0,0,-@unit_len); translate(0,-@unit_len)", #"line to" command?
					 
					 "a" => "line(0,0,0,-30); translate(0,-30)",
					 "b" => "rotateZ(radians(90))"
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
	
		load 'recur.rb' #get the function letter_array		

		@letters = @word.split(//)
		@letter_array = letter_array
			
			def run
			### Run the model
			# split the word into an array of 'letters'			
			@letter_array.each do |letterset|
				@sublength = letterset.length
				letter = letterset[0..0]
				puts letterset.to_s + " <word subl> " + @sublength.to_s
				unless $alphabet[letter].nil?
					eval($alphabet[letter])
				end
			end
		end #run
		run
	
		@az = 0
		def rotate
			@az += 5
			rotateY radians(@az)
		end
	end #end setup
	
	
	
	# Create node class, object
	#   when it's manipulated, only rotate in increments of angle_unit (1 deg)
	#   find the most recent previous [, append +s or -s depending on direction/quadrant of mouse movement
	#   redraw model ( happens automatically with draw() )

	def draw
		background 360,0,360,360
		translate 300,600
		rotate
		run
	end
	
end