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
Shoes.app :width => 450, :height => 700 do

	background "#73461F"

	#
	# 	HEADER
	#
	@header = flow :width => 450, :margin => 10 do
		background "#402C14", :curve => 10
		title "L-System Builder", :font => 'Georgia', :stroke => "#FFF", :align => 'center'
		
		flow :margin => ['20%', '0px', '20%', '5px'] do
			para "Axiom:", :font => 'Georgia', :stroke => "#FFF"
			@axiom_line = edit_line :text => 'X', :width => 150
			para "\n"
			para "Number of times to rewrite the string with the rules:", :font => 'Georgia', :stroke => "#FFF"
			@times = edit_line :text => '7', :width => 30
			para "\n"
			para "Line (F) length:", :font => 'Georgia', :stroke => "#FFF"
			@line_length = edit_line :text => '1', :width => 40
			para "\n"
			para "Branching angle - [ ]:", :font => 'Georgia', :stroke => "#FFF"
			@angle_deg = edit_line :text => '20', :width => 40
			para " deg", :font => 'Georgia', :stroke => "#FFF"

			button "Generate Word" do
				load 'generate.rb'
				@axiom = @axiom_line.text
				@footer.clear do
					background "#FFF", :curve => 10
					#@arr.each do | val |
					#	para val.pred.to_s + " " + val.prob.to_s + " " + val.succ.to_s
					#end
					@word = generate(@axiom.to_s, @arr, @times.text.to_i)
					@word_line = edit_box "#{@word}", :width => 400, :height => 100, :margin => ['5%', '5%', '0px', '0px']
				end
			end
			
			button "Grow Plant!" do
				system "rp5 run imager.rb #{ @word } #{ @line_length.text } #{ @angle_deg.text }"
			end
			
		end
		
	end # header flow


	#
	# 	RULE BUILDER
	#
	
	#Default rules
	load 'rule_classes.rb'
	#def initialize( subrules, lcon, pred, rcon, prob, succ )
	@a = Rule.new( nil, nil, "X", nil, 1, "F[+X]F[-X]+X" )
	@b = Rule.new( nil, nil, "F", nil, 1, "FF" )
	#@arr = ["a","b","c"]
	@arr = [ @a, @b ]
	# Define a draw function that loops through the array,
	def display_array
	
	@arr.each_with_index do | val, ind |
		flow do # Printing the array inside a flow with
			
			if @editing == ind
				@i = edit_line :text => "#{val.pred}", :width => 40
				@j = edit_line :text => "#{val.prob}", :width => 40
				@k = edit_line :text => "#{val.succ}", :width => 100
				button "Save" do
					@edited_element = Rule.new(nil, nil, @i.text.to_s, nil, @j.text.to_f, @k.text.to_s)
					@arr[ind] = @edited_element
					@editing = nil
					refresh_display
				end
				button("x") { @editing = nil; refresh_display }
			else
				para val.pred.to_s
				para "--"
				para val.prob.to_s
				para "->"
				para val.succ.to_s
				
				button("edit") { @editing = ind; refresh_display }
				
				button "x" do
					if confirm("You sure?")
						@arr.delete_at(ind)
						refresh_display
					end #if
				end #button
			end
		# an edit button and a delete button			
		end #flow
	end # arr.each
	
	# With an add button at the end.
	@add_element = flow :width => 400 do
		para "Predecessor:"
		@e = edit_line :width => 40
		para "\n"
		para "Probability:   "
		@f = edit_line :width => 40
		para "\n"
		para "Successor:   "
		@g = edit_line :width => 100
		para "\n"
		button "Add Rule" do
			@new = Rule.new(nil, nil, @e.text.to_s, nil, @f.text.to_f, @g.text.to_s)
			@arr << @new
			refresh_display
		end #button
	end

end # display_array
	
	def refresh_display
		@display.clear do
			background "#D9D279", :curve => 10
			display_array
		end
	end

	@display = stack :width => 450, :margin => ['20px', '5px', '20px', '0px'] do
		background "#D9D279", :curve => 10
		display_array
	end
	
	@footer = stack :width => 450, :margin => ['20px', '5px', '20px', '0px'] do
		background "#FFF", :curve => 10
		@word_line = edit_box "#{@word}", :width => 400, :height => 100,  :margin => ['5%', '5%', '0px', '0px']
	end

# End app loop
end