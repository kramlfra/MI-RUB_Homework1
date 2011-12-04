#rectangle
module RectangleModule	
	class Rectangle
		attr_accessor :x, :y, :length
		def initialize(x,y,length)		
			@x=Float(x)
			@y=Float(y)
			@length=Float(length)
		end
		def x_left
			prom = @x - @length/2
			return prom
		end		
		def x_right
			prom = @x + @length/2
			return prom
		end
		def y_down
			prom = @y - @length/2
			return prom
		end
		def y_up
			prom = @y + @length/2
			return prom
		end		
	end
end