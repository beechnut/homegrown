# REALLY HASH IT OUT, YOU'RE CLOSE
module SubruleChooser

	def choose  #called on a rule
		
		statement = "case rand; "
		first == 0
		last == subrules.length-1
		
		subrules.each_with_index do |rule, index|
			if index == first
				statement += "when 0..#{rule.prob} : return rule; "
				lastprob = prob
			elsif index == last
				statement += "when lastprob..1 : return rule;"
			else
				statement += "when lastprob..#{lastprob + rule.prob} : return rule; "
				lastprob = prob
			end
		end
		
		statement += "else return nil; end;"
		
		# run it
		#eval(statement)
		
	end # choose

end # SubruleChooser module