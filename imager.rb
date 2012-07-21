

# 
# GOAL: Translate model word to image
# using standard symbols
# 
# To create the model, need
# word
# model alphabet V for DOL systems, which is a hash of models for each of the letters and symbols in the word
# turtle-style drawing method
#
#

class Imager < Processing::App


	def setup
		
		size 1200, 700, P3D
		color_mode HSB, 360
		background 180, 360, 100, 360
		smooth
		ellipse_mode(CENTER)
		lights
		fill 100, 250, 360
		stroke_weight 2
		
		#parameters
		@angle_deg = 22.5
		#n specified in word
		
		
		#  set up words to put into the variable
		@word = "[&F[RLRLf]RRRRRF[RLRLf]RRRRRF[RLRLf]RRRRRF[RLRLf]]"
		@word2 = "[&F[RLRLf]RRRRRF[RLRLf]RRRRRF[RLRLf]RRRRRF[RLRLf]]"
		@word3 = "[&F[RLRLf]RRRRRF[RLRLf]RRRRRF[RLRLf]RRRRRF[RLRLf]]"
		#  set up the array 
		@word_list = [@word, @word2, @word3]

		@alphabet = {"F" => "stroke 40, 100, 100; line (0,0,0,-1); translate(0,-1)",
					 "f" => "no_stroke; ellipse(0,0,10,50)",
					 "[" => "pushMatrix()",
					 "]" => "popMatrix()",
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
					 
					 "X" => "line (0,0,0,-1); translate(0,-1)",
					 
					 "a" => "line (0,0,0,-30); translate(0,-30)",
					 "b" => "rotateZ(radians(90))"
					}
				
		translate 200, 660 

		
		@word_list.each do | @word |
			@letters = @word.split(//)
			puts 'making model'
			@letters.each do |letter|
				unless @alphabet[letter].nil?
					eval(@alphabet[letter])
				end
			end
			translate 200, 0
		end

	
	
	end #end setup

	
	def draw
		
	end
	
end



# [ { "A" => "[&FJ!A]RRRRR'[&FJ!A]RRRRRRR'[&FJ!A]" }, { "F" => "SRRRRRF" }, { "S" => "FJ" }, { "J" => "['''RLRLf]" } ]