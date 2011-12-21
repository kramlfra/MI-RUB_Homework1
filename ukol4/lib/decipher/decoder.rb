module DecipherModule
	class Decoder
		attr_accessor :result
		def self.decode(lines)
			pos = 0			
			@result = Array.new
			" ".each_byte do |c|
				$char = c.chr
			end
			lines.each{ |i|				
				symbol = 0				
				#rotace o 7 znaku
				i.each_byte { |ascii|
					if(ascii >= 7)
						ascii = ascii-7
					else				
						ascii = 127 - (6-ascii)
					end
					#detekce spatneho znaku kvuli odradkovani
					if (ascii != 3)
						i[symbol]=ascii.chr						
						symbol = symbol+1				
					end
				}				
				@result[pos] = i
				pos = pos + 1
			}			
			puts @result
			return @result
			
		end
	end
end