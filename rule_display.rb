###in the app, set up a DisplayArray. [stack, text, edit, delete, save]

module RuleDisplayModule

	# RuleDisplay class handles all the displaying and editing
	# of rules in the array
	class RuleDisplay
		
		### set sample rules
		load 'rule_classes.rb'
		###
		
		attr_accessor :rule_list, :rules, :stack, :edit_list
		
		def initialize(stack)
			@stack = stack
			
			@rule1 = Rule.new(nil, nil, "X", nil, 1, "A")
			@subrule1 = Rule.new(nil, nil, "F", nil, 0.5, "f")
			@subrule2 = Rule.new(nil, nil, "Q", nil, 0.5, "L")
			@rule2 = Rule.new([@subrule1, @subrule2], nil, nil, nil, nil, nil)
			
			@rules = [ @rule1, @rule2 ]
			@rule_list = @rules
			$edit_list = [ "false", "false" ]
		end

		#def rules(rule_list)
		#	@rule_list = rule_list
		#end
		
		
		# global variables: $editing_rule, $editing_alphabet
		# when $editing_rule is true, all the edit buttons are hidden, only the 
		# DisplayArray = 
		# [
		# 	@rule, editing?    <-- append each of these things depending on conditions
		#   ...
		#   ...
		# ]
		#
		# when displaying, edit button gets an attribute :selected
		# on click of a button, scan array - do each with index, return index, display array
		#   without edit buttons, display editline and save button for rule[edit_index], when save - edit none
		# 
		
		def display
			
			#@stack.append do
			#	stack.app do
			#		para "editlist = " + @edit_list.to_s
			#	end
			#end
			
			@rule_list.each_with_index do |rule, index|
				@stack.append do
				  stack.app do
				  
				  	flow :width => 450, :margin => 20 do
				  		#background "#FEC"
				  		border black, :strokewidth => 2
							#para rule.subrules.to_s
							#para rule.pred + " --" + rule.prob.to_s + "-> " + rule.succ
							
							#if edit_list[index] == "false"
							
									#if it has no subrules
									if rule.subrules.nil? 
										# print the rule
										text = para "p" + index.to_s + ": " + rule.pred + " --" + rule.prob.to_s + "-> " + rule.succ
									# otherwise, if it has subrules
									else
										rule.subrules.each_with_index do |subrule, subindex|
											# print the rule
											para "p" + index.to_s + "." + subindex.to_s + ": " + subrule.pred + " --" + subrule.prob.to_s + "-> " + subrule.succ
										end # subrule loop
									end # conditional printing
									
									stack :width => 60, :right => 40 do
										button "Edit" do |b|
											alert "Edit!" + index.to_s
											$edit_list[index] = "true"
											alert $edit_list[index]
										end
										
										button "Delete" do
											alert "Delete!" + index.to_s
										end
									end
									
						#	elsif @edit_list[index] == "true"
			
						#end # if edit list
							
							#add buttons to the array of edit buttons, delete buttons.
							# clicked one changes the rest
							
			 			end
			 				
			 	  end
			  end
			end
		end
		
	end #class RuleDisplay

end #module




# App
#   Displays list of rules
#   Adds rule
#   Removes rule from array and display
#   Edits rule, and updates in array

Shoes.app :width => 500, :height => 750 do
	background "#5C3".."#DF8"
  
  extend RuleDisplayModule
	title "Rule Builder"
	
	para ""

	def refresh
		@display.clear do
			background "#FFF"
		  @rule_display.display
			@display.append do
				$edit_list.each_with_index do |list, val|
					para list + val.to_s
				end
			end
		end
	end
	
	@input = stack :width => 400, :left => 50, :top => 80 do
		background "EEE"
		subtitle "Input"
		flow do 
			stack :width => 50 do
				para "lcon"
				@input_lcon = edit_line :width => 40
			end
			stack :width => 50 do
				para "pred"
				@input_pred = edit_line :width => 40
			end
			stack :width => 50 do
				para "rcon"
				@input_rcon = edit_line :width => 40
			end
			stack :width => 50 do
				para "prob"
				@input_prob = edit_line :width => 40
			end
			stack :width => 50 do
				para "succ"
				@input_succ = edit_line :width => 40
			end
		end

		flow do
			button "Add rule" do
				unless @input_pred.text.empty? or @input_prob.text.empty? or @input_succ.text.empty?
					@rule_display.rule_list << Rule.new(nil, @input_lcon.text, @input_pred.text, @input_rcon.text, @input_prob.text, @input_succ.text)
					refresh
				end
			end
			
			button "Refresh" do
				refresh
			end # refresh button
			
			button "Clear" do
				@rule_display.rule_list.clear
				refresh
			end # clear button
						
		end #flow
	
	end #input stack

		# RuleDisplay implementation
	@display = stack :width => 450, :margin => 10 do
		background "#FFF"
	end
	
  @rule_display = RuleDisplay.new(@display)
  @rule_display.display
	
  
  
	
end