module DecipherModule
	class Reader
		attr_accessor :lines
		
		def initialize(filename)
			@lines = IO.readlines(filename)
		end
		
		def test_out
			puts @lines
			return @lines
		end
	end
end