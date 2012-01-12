module Generator
	class Question
		attr_accessor :question, :answers
		
		def initialize(string)
			@question = string
			@answers = []
		end
		def set_answer(answer)
			@answers << answer
		end
	end
end