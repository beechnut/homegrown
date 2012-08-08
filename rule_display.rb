###in the app, set up a DisplayArray. [stack, text, edit, delete, save]

module RuleDisplayModule

	# RuleDisplay class handles all the displaying and editing
	# of rules in the array
	class RuleDisplay
		
		### set sample rules
		load 'rule_classes.rb'
		###
		
		attr_accessor :rule_list, :rules, :stack
		
		def initialize(stack)
			@stack = stack
			
			@rule1 = Rule.new(nil, nil, "X", nil, 1, "A")
			@subrule1 = Rule.new(nil, nil, "F", nil, 0.5, "f")
			@subrule2 = Rule.new(nil, nil, "Q", nil, 0.5, "L")
			@rule2 = Rule.new([@subrule1, @subrule2], nil, nil, nil, nil, nil)
			
			@rules = [ @rule1, @rule2 ]
			@rule_list = @rules
		end

		def rules(rule_list)
			@rule_list = rule_list
		end
		
		
		def display
			@rule_list.each do |rule|
				@stack.append do
				  stack.app do
				  
				  	flow :width => 450, :margin => 20 do
				  		background "#FEC"
				  		border black, :strokewidth => 2
							#para rule.subrules.to_s
							#para rule.pred + " --" + rule.prob.to_s + "-> " + rule.succ
							
							
							#if it has no subrules
							if rule.subrules.nil? 
								# print the rule
								text = para rule.pred + " --" + rule.prob.to_s + "-> " + rule.succ
							# otherwise, if it has subrules
							else
								rule.subrules.each_with_index do |subrule, index|
									# print the rule
									para subrule.pred + " --" + subrule.prob.to_s + "-> " + subrule.succ
								end # subrule loop
							end # conditional printing
							
							stack :width => 60, :right => 40 do
								button "Edit" do |b|
									alert "Edit!"
									b.parent.background "#DFA"
									b.parent.text = edit_line :width => 40
								end
								
								button "Delete" do
									alert "Delete!"
								end
							end
							
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
			end
			
			button "Clear" do
				@rule_display.rule_list.clear
				refresh
			end
			
		end
	
	end

		# RuleDisplay implementation
	@display = stack :width => 450, :margin => 10 do
		background "#FFF"
	end
	
  @rule_display = RuleDisplay.new(@display)
  #@rule_display.rules(@rules)
  @rule_display.display
	
	
end