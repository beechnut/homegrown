class Branch

	include Processing::Proxy

	attr_reader :start_point, :end_point
	
	def initialize( node1, node2, order = 0 )
		@start_point = node1
		@end_point = node2
		@order = order
	end
	
	def draw_as_line
		stroke 0, 0, 0
		stroke_weight 2
		line(@start_point.node_x, @start_point.node_y, @start_point.node_z, @end_point.node_x, @end_point.node_y, @end_point.node_z)
	end
	

end