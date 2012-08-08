# RuleDisplay class handles all the displaying and editing
# of rules in the array

class RuleDisplay
	
	def initialize(rule_list)
		@rule_list = rule_list
	end
	
	def display_rules
		@rule_list.each do |rule|
		flow :width => 440, :margin => 10 do
			@rule_text = para rule["index"] + " " + rule["subindex"] + " " 
				 + rule["lcon"] + " " + rule["pred"] + " " 
				 + rule["rcon"] + " " + rule["prob"] + " " 
				 + rule["succ"]
		
			# Addresses a global variable if anything is being edited, all the edit buttons hide
			# Otherwise, show them all
			# TODO: Figure this out
			button "Edit" do |b|
				b.hide
			end #edit button
		
			button "Delete" do |b|
				@confirm = confirm("Do you want to delete this rule?\n#{@rule_text}")
				if @confirm.to_s == "true"
					b.parent.clear
				end
				@rule_list.destroy(rule["index"])
			end # delete button
			
		end #flow
	end # display_rules function

end #class RuleDisplay



# Handles display and editing of visual rules
class DictionaryDisplay
	#Quick question: can I make a 
end



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
  @rule_display = RuleDisplay.new(@rule_list)
  @dictionary_display = DictionaryDisplay.new(@dictionary)
  
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
		button("Run Model") { system 'rp5 run ColorCube.rb' }
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