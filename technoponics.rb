
def add_rule
	# ONE LINE OF RULES
	flow :width => 440, :margin => 10 do
		background "#EEE", :radius => 40
		para "p"
		@rule_num = edit_line :width => 50
		para ": "
		@l_con = edit_line :width => 50
		para " < "
		@pred = edit_line :width => 50
		para " > "
		@r_con = edit_line :width => 50
		para " =="
		@prob = edit_line :width => 50
		para "=> "
		@succ = edit_line :width => 50
		
		#BUTTONS
		# Read back
		button "Read back." do
			alert @l_con.text + " < " + @pred.text + " > " + @r_con.text + " ==" + @prob.text + "=> " + @succ.text
		end # read back button
		
		button "subrulize" do |b|
			b.parent.move(40, 35)
			b.parent.background "#CCC"
			alert "Made the rule a subrule."
		end # subrulize
		
		button "unsubrulize" do |b|
			b.parent.move(0, 35)
			b.parent.background "#EEE"
			alert "Made the rule a normal rule."
		end # unsubrulize
		
		button "delete" do |b|
			@tf = confirm("You sure?")
			if @tf.to_s == "true"
				b.parent.clear
			end
		end
		
	end #flow of one rule
	#END ONE LINE OF RULES
end

# MAIN APP
Shoes.app :width => 500, :height => 750 do
	#rgb(170, 206, 120) =>
	background "#5C3".."#DF8"
  
  @rule_list = []
  @dictionary = []
  
  	#TITLE
  	stack :width => 450, :margin => 10, :top => 20 do
		background "#520"
		title(
			"Technoponics",
			:align => "center",
			:font => "Georgia",
			:stroke => white
  		)
	end
	
	#TODO : HELP MENU
	stack :width => 450, :margin => 10 do
		background "#FFF"
		para (link("Manual", :click=>""))
		para (link("Contribute", :click=>"http://www.github.com/beechnut/grooby"))
		para (link("Help", :click=>""))
	end
	
	#TODO : RUN BUTTON
	stack :width => 450, :margin => 10 do
		background "#FFF"
		button("Run Model") { alert("This will be the run function, someday.") }
	end
	
	#TODO : TABS
	stack :width => 450, :margin => 10 do
		background "#FFF"
		para "| RULE BUILDER | VISUAL ALPHABET |\n",
		"do me last"
	end
	
	#TODO : TAB : RULE BUILDER (show/hide)
	@rules = stack :width => 450, :margin => 10 do
		background "#FFF"
		para "Rule Builder"
		
		
		button "add new rule" do
			add_rule
		end
		
		
	end #stack of rules
	
	#TODO : TAB : VISUAL ALPHABET (show/hide)
	stack :width => 450, :margin => 10 do
		background "#FFF"
		para "Visual Alphabet"
	end
	
end