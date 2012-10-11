# Tree and TreeController Test

# kind of a big deal
# tests whether the tree creates, displays, and is manipulable


class TreeTest < Processing::App

	load '../controllers/tree_controller.rb'
	
	def setup
		size 500, 500, P3D
		color_mode HSB, 100
		@tc = TreeController.new("[FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF[-FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFFFFFFFFFF[+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFFFFFFFFFF[-FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFFFFFF[+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]FFFFFFFF[-FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]+FFFF[+FF[+X]FF[-X]+X]FFFF[-FF[+X]FF[-X]+X]+FF[+X]FF[-X]+X]")
		@tc.interpret
		no_loop
	end
	
	def draw
		background 66, 20, 95
		pushMatrix
			translate width/2, height+10000, -40000
			@tc.draw
		popMatrix
	end
	
	def mouse_clicked
		@tc.mouse_clicked
		redraw
	end
	
	def mouse_moved
		@tc.mouse_moved
		redraw
	end

end



# later version will test future, next generations
# gui
# two rects, on mouse clicked move forward, backward a generation