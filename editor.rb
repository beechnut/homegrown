# editor.rb
#
# Edits, deletes, and adds to an array via GUI.
#

# Narrative
# Set up app loop
	# Pass in an array to start with
	# Define a draw function that loops through the array,
		# Printing the array with
		# an edit button and a delete button
	# With an add button at the end.
# End app loop

# Set up app loop
Shoes.app do
	# Pass in an array to start with
	@arr = ["a", "b", "c"]
	# Define a draw function that loops through the array,
	def display_array
		@arr.each_with_index do | val, ind |
		flow do # Printing the array inside a flow with
			
			if @editing == ind
				@i = edit_line :width=>100
				button "Save" do
					@arr[ind] = @i.text
					@editing = nil
					refresh
				end
			else
				para val

				button "Edit" do
					@editing = ind
					refresh
				end
				
				button "Delete" do
					
					if confirm("You sure?")
						@arr.delete_at(ind)
						refresh
					end
				end

			end
			# an edit button and a delete button
			
			
			end
		end
	# With an add button at the end.
	end

	
	def refresh
		@display.clear do
			display_array
		end
	end

	@display = stack :width=>600, :height => 400 do
		display_array
	end

	
	stack :width=>400 do
		@e = edit_line
		button "Add" do
			@arr << @e.text
			refresh
		end
	end
	
# End app loop
end