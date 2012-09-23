# HistoryTest
# Checks all the functions of the history to make sure they're all in sync and pretty

class HistoryTest
	
	attr_accessor :history
	
	load '../models/history.rb'
	load '../controllers/history_controller.rb'
	
	@history = History.new("FFXF")
	
	
end