# NodeTest
# makes sure Node and NodeController work as desired


class NodeTest < Processing::App
	
	class HLine
		
		def initialize(y, x)
			@y = y
			@x = x
		end
		
		def setup
			stroke 200
			stroke_weight 2
		end
		
		def draw
			line(0, @y, @x, @y)
		end
		
		def highlight
			stroke 200, 10, 20
			stroke_weight 5
			draw
		end
		
	end #HLine

	def setup
		size 200, 200
		background 20
		@arr = []
	end
	
	def draw
		background 20
		@arr.each do |r|
			r.highlight
			r.setup
			r.draw
		end
	end
	
	def mouse_clicked
		@arr << HLine.new(mouse_y, mouse_x)
		puts @arr.length
	end
	
	def mouse_dragged
		mouse_clicked
	end
	
end