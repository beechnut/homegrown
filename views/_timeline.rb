# 
# Timeline
#	by Matt Cloyd
#
# 	Timeline slider reflects history, movable +/- generations
# 	Buttons for adding a generation or removing an axiom
# 

class Timeline
	
	include Processing::Proxy

	def draw
		fill 0
		stroke 255
		rect(10, 10, 100, 205)
		fill 200
		text("Timeline", 140, 140)
		puts "Timeline#draw"
	end
	
end
