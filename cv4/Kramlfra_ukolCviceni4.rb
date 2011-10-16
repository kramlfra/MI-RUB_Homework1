#VowelFinder

module Summable
  def sum
    inject(:+)
  end
end

class VowelFinder
  include Enumerable
  include Summable
  
	def initialize(string)
		@string = string
	end
  
	def each
		@string.split('').each do |x|
			yield x if 'aeiyou'.include?(x)
		end
	end
end

vf = VowelFinder.new("the quick brown fox jumped")
puts vf.inject(:+)
puts vf.sum