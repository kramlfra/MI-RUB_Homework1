#compare
require_relative './rectangle'
module CompareModule	
	
	def CompareModule.compare(rectangles)
		
		#print "compare v cajku"
		#p rectangles
		rect1 = rectangles[0]
		rect2 = rectangles[1]
		#p rect1
		#p rect2
		
		if(CompareModule.in(rect1,rect2)) # pokud se nekde prekryvaji
			#print "ctverce maji neco spolecneho"
			xlen = CompareModule.xlen(rect1.x_left, rect2.x_left, rect1.x_right, rect2.x_right)
			ylen = CompareModule.ylen(rect1.y_down, rect2.y_down, rect1.y_up, rect2.y_up)
			badArea = xlen*ylen
			completArea = rect1.length*rect1.length + rect2.length*rect2.length
			rightArea = completArea - badArea
			#print "BadArea dvou ctvercu je "+badArea.to_s+"\n"
			#print "completArea dvou ctvercu je "+completArea.to_s+"\n"
			print "Obsah sjednoceni dvou ctvercu je "+rightArea.to_s+"\n"
			return rightArea
		else
			print "Ctverce se ani nedotykaji"
			return 0
		end
		
		
		
	end
	
	def CompareModule.in(rect1,rect2)
		#print "stupid text"
		if (rect2.x_left > rect1.x_right || rect2.x_right < rect2.x_left || rect2.y_up < rect1.y_down || rect2.y_down > rect1.y_up)
			return false
		end
		
		return true
	end
	
	def CompareModule.xlen(left_x1,left_x2,right_x1,right_x2)
		if(left_x1 > left_x2)
			max = left_x1
		else
			max = left_x2
		end
		if(right_x1 < right_x2)
			min = right_x1
		else
			min = right_x2
		end
		#p min
		#p max
		return min - max
	end
	
	def CompareModule.ylen(down_y1,down_y2,up_y1,up_y2)
		if(down_y1 > down_y2)
			max = down_y1
		else
			max = down_y2
		end
		if(up_y1 < up_y2)
			min = up_y1
		else
			min = up_y2
		end
		#p min
		#p max
		return min-max
		
	
	end
end