# HistoryTree Test
#
#
# there is a left button, to interpret a word from one history gen previously, or nothing
# there is a right button, to interpret a word from one gen after, or pushes the word into
	# history (generate, rule classes) and then interprets it
# the tree is at all times manipulable, and manipulations are reflected in future generations

# Params
#  - rules will be stored in text format, static, in the sketch
#  - the axiom will be stored, static, in the sketch

# Research
# [x] How to implement clickable buttons.
# [x] How to get generate to call non-inline
# [ ] How to properly access the history_controller in this sketch

class Button

	include Processing::Proxy

	attr_reader :event
	
	def initialize(left, top, width, height, color, text, event)
		@left = left
		@top = top
		@width = width
		@height = height
		@color = color
		@text = text
		@event = event
	end
	
	def hover
		if mouse_x > @left and mouse_x < @left+@width and mouse_y > @top and mouse_y < @top+height
			return true
		end
	end
	
	def draw
		push_style
			stroke 0
			stroke_weight 2
			fill @color
			rect_mode(CORNER)
			rect(@left, @top, @width, @height)
			text_align(CENTER)
			fill 0
			text(@text, @left + @width/2, @top + @height/2) #change to self.width,height if this fails
		pop_style
	end
	
	def highlight
		push_style
			stroke 0
			stroke_weight 3
			fill 100, 100, 200
			rect_mode(CORNER)
			rect(@left, @top, @width, @height)
			text_align(CENTER)
			fill 0
			text(@text, @left + @width/2, @top + @height/2)
		pop_style
	end

end


class ButtonController

	include Processing::Proxy
	
	def initialize
		@buttons = []
	end
	
	def add(button)
		@buttons << button
	end
	
	def hover_assess
	  @buttons.each do |button|
	  	if button.hover
		  	button.highlight
		  else
		  	button.draw
	  	end
	  end
	end
	
	def click_assess
		@buttons.each do |button|
			if button.hover
				return button
				break
			end
		end
	end
	
end

class HistoryTreeTest < Processing::App

	load_library :opengl
	include_package "processing.opengl"
	
	require '../models/tree.rb'
	require '../controllers/tree_controller.rb'
	#require '../generate.rb'
	require '../rule_classes.rb'

	def setup
		size 1000, 800, OPENGL
		background 255

		# Camera Control		
		@ix = 0
		@iy = 0
		@iz = 0
		
		@c1 = color(50, 50, 150)
		@c2 = color(50, 150, 50)
		
		@b1 = Button.new(80, height/2, 50, 50, @c1, "<", 'regress_generation')
		@b2 = Button.new(width-80, height/2, 50, 50, @c2, ">", 'advance_generation')
		@bc = ButtonController.new
		@bc.add(@b1)
		@bc.add(@b2)
		
		@tc = TreeController.new("[F]")
		@tc.interpret
		no_loop
	end
	
	def advance_generation
		puts "HistoryTreeTest#advance_generation"
		@tc.advance_generation
		@tc.disintegrate
		@tc.interpret
	end
	
	def regress_generation
		puts "HistoryTreeTest#regress_generation"
		@tc.regress_generation
		@tc.disintegrate
		@tc.interpret
	end
	
	def draw
		background 255
		lights
		pushMatrix
			translate width/2, height-20
			@tc.draw
		popMatrix
		camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + @iz, #
					width/2.0, height/2.0 + @ix, 0, #
					0, 1, 0) #
		@bc.hover_assess
		#puts "HistoryTreeTest#draw"
	end
	
	def key_pressed
		case key
			when 'w'
				puts "TreeController#key_pressed: w, eyeX+50 " + @ix.to_s
				@ix -= 50
			when 's'
				puts "TreeController#key_pressed: s, eyeX-50 " + @ix.to_s
				@ix += 50
			when 'e'
				puts "TreeController#key_pressed: e, eyeZ-50 " + @iz.to_s
				@iz -= 50
			when 'd'
				puts "TreeController#key_pressed: d, eyeZ+50 " + @iz.to_s
				@iz += 50
		end
		redraw
	end
		
	def mouse_clicked
		@clicked = @bc.click_assess
		eval(@clicked.event) unless @clicked.class == Array
		@tc.mouse_clicked
		redraw
	end
	
	def mouse_moved
		@tc.mouse_moved
		redraw
	end




end