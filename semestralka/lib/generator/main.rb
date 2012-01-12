module Generator
	class Main
		@@tests
		attr_accessor :filename, :reader
		
		def setFile(filename)
			@filename = filename
			if(filename.length  === 0)
				raise ArgumentError, "NO argument"
			end
			
			File.open(filename,"r")
			rescue 
				raise IOError , "File doesn't exist"			
		end
		
		def read
			@reader = Generator::Reader.new(@filename)
		end
		
		def parseLines
			#p "make test function"
			@@tests = @reader.parse_lines		
		end
		
		def makeTest
			#p @@tests
			Generator::TestClass.makeTestForPPT(@@tests)
			Generator::TestClass.makeTestLatex(@@tests)
		end
	end
end