# InteractionController

# Redirects all mouse actions to the appropriate controller.
# Handles all the up/down/moving logic.

# Other types of interactions, namely, Pan, Rotate, Grip, Graft should inherit
# from this. How does inheritance work?

class InteractionController

	include Processing::Proxy
	
	def initialize
		@node_controller = NodeController.new
	end

	def mouse_clicked
		@node_controller.mouse_clicked
		# When it's not just the nodes responding to mouse clicks, this
		# will handle the logic of the click.
		# Question: Could it get a GUI object in the app
		# @gui_object via $app.gui_object.var?
	end
	
	def mouse_moved
		@node_controller.mouse_moved
		# When it's not just the nodes responding to mouse clicks, this
		# will handle the logic of the click.
	end
	
	def mouse_dragged
		# CAMERA CONTROLLER - TODO
		# camera controller functions: 
		#
		#
	end
	
end