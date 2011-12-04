#init
require_relative './rectangle'
module Init		
	def Init.run		
		name = 'prvniho'
		rectangles = Array.new(0);
		length = 0;
		x = 0;
		y = 0;
		2.times do |i|		
			print "Zadejte delku hrany #{name} ctverce: "
			begin
				length = gets
				length = Float(length)
			rescue
				print "Spatny vstup"
				exit
			end			
			if(length < 0)
				print "Spatny vstup"
				exit
			end
			print "zadej x-ovou souradnici stredu #{name} ctverce: "
			begin
				x = gets
				x = Float(x)
			rescue
				print "Spatny vstup"
				exit
			end
						
			print "zadej y-ovou souradnici stredu #{name} ctverce: "
			begin
				y = gets
				y = Float(y)
			rescue
				print "Spatny vstup"
				exit
			end
						
			rectangle = RectangleModule::Rectangle.new(x,y,length)
			rectangles << rectangle
			name = 'druheho'
		end		
		return rectangles
	end
end