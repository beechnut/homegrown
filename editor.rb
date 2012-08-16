# editor.rb
#
# Edits, deletes, and adds to an array of rules via GUI.
# Generates a word

# Narrative
# Set up app loop
	# Pass in an array to start with
	# Define a draw function that loops through the array,
		# Printing the array with
		# an edit button and a delete button
	# With an add button at the end.
# End app loop

# Set up app loop
Shoes.app :width => 1150 do
	@color_light_green = "#9CBA46"
	@color_dark_green = "#5F6E34"
	@color_deep_sky = "#479C94"
	@color_dark_brown = "#3B2113"
	@color_tan = "#BA9C5F"

	background @color_tan

	#
	# 	HEADER
	#
	@header = flow :width => 1130, :margin => 10 do
		background @color_deep_sky, :radius => 10
		title "L-System Builder        "
		button "Run Model" do
			system 'rp5 run imager.rb'
		end
		button "Generate Word" do
			# load generate
			# use the rules here to generate a word
			# display the word in the footer
		end
	end #flow


	#
	# 	RULE BUILDER
	#
	
	def load_presets
		#load presets
		@arr0 = ["a", "b", "c"]
		@arr1 = ["d", "e", "f"]
		@arr2 = ["g", "h", "i"]
		@arrays = [@arr0, @arr1, @arr2]
		
		@arr = @arrays[0]
	end
	load_presets
	def load_preset_rules
	end
	load_preset_rules
		
	# Define a draw function that loops through the array,
	def display_array
	
		@arr.each_with_index do | val, ind |
		flow do # Printing the array inside a flow with
			
			if @editing == ind
				@i = edit_line :width => 100
			   
				button "Save" do
					@arr[ind] = @i.text
					@editing = nil
					refresh_display
				end
				button "x" do
					@editing = nil
					refresh_display
				end
			else
				para val

				button "edit" do
					@editing = ind
					refresh_display
				end
				
				button "x" do
					if confirm("You sure?")
						@arr.delete_at(ind)
						refresh_display
					end
				end
			end
			# an edit button and a delete button			
			end
		end

		# With an add button at the end.
		@add_element = flow :width=>400 do
			@e = edit_line
			button "+" do
				@arr << @e.text
				refresh_display
			end #button
		end #flow

	end
	
	def refresh_display
		@display.clear do
			background @color_light_green
			#display_preset_chooser
			display_array
		end
	end

	@display = stack :width => 600, :height => 350, :margin => 10 do
		background @color_light_green
		#display_preset_chooser
		display_array
	end
	
	@alphabet = stack :width => 475, :height => 350, :margin => 10 do
		background @color_light_green
		#display_alphabet
	end


	# PRESET CHOOSER
	# Lists possible arrays
#	def display_preset_chooser
#		@display_preset_chooser = stack :width => 500, :margin => 10 do
#			background @color_dark_green
#			para "Choose a Preset:"
#			@l = list_box :items => @arrays, :choose => @arr do | item |
#				@arr = item.text
#				refresh_display
#			end
			
#			button "Save Presets" do
#				File.open('presets.rb', 'w') do | file |
#				  @arrays.each do | arr |
#				  	file.puts arr.to_s + "\n"
#				  end
#				end
#				alert("Saved successfully.")
#			end
#			
#		end #preset chooser stack
#	end



	############################
  #		DON'T WORRY ABOUT IT	 #
	############################
	
	#
	# 	ALPHABUILDER
	#	
	#def display_alphabet
	#	para "alphabet builder"
	#end
	#def refresh_alphabet
	#end

	#
	# 	WORD FOOTER
	#
	#@word = "FFFFfffFFfAX"
	#@footer = flow :width => 1130, :margin => 10 do
	#	background @color_deep_sky, :radius => 10
	#	para @word
	#end #flow


# End app loop
end