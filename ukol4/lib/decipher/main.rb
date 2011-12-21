require_relative 'reader'
require_relative 'decoder'

module DecipherModule
	class Main
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
			@reader = DecipherModule::Reader.new(@filename)
		end
		
		def decode
			DecipherModule::Decoder.decode(@reader.lines)
		end
	end
end