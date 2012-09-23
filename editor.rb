#!/usr/bin/env ruby

# Editor

class Editor < Processing::App
	
	# load all necessary models and controllers
	load 'controllers/interaction_controller.rb'

	def setup
		@interaction_controller = InteractionController.new
		update
		puts "Editor#setup"
	end
	
	def mouse_clicked
		# Send the mouse click to the Interaction Controller. It'll do the dirty work.
		@interaction_controller.mouse_clicked
		puts "Editor#mouse_clicked"
	end
	
	def mouse_moved
		# Send the mouse move to the Interaction Controller. It'll do the dirty work.
		@interaction_controller.mouse_moved
		puts "Editor#mouse_moved"
	end
	
	def mouse_dragged
		# Send the mouse drag to the Interaction Controller. It'll do the dirty work.
		@interaction_controller.mouse_dragged
		puts "Editor#mouse_dragged"
	end
	
end