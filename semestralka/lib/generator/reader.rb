module Generator
	class Reader
		attr_accessor :lines
		
		def initialize(filename)
			@lines = IO.readlines(filename)
		end
		
		def test_out
			#puts @lines
			return @lines
		end
		def parse_lines
			numberOfTests=Integer(@lines[0])			
			numberOfQuestions=Integer(@lines[1])		
			numberOfAnswers=Integer(@lines[2])
			
			counter = Integer(4)
			testCounter = Integer(1)
			questionCounter = Integer(1)
			
			arrayOfTests = Array.new
			
			while testCounter <= numberOfTests 
				arrayOfQuestions = Array.new
				while questionCounter <= numberOfQuestions
					tempQuestion = Generator::Question.new(@lines[counter])
					counter = counter + 1					
					answerCounter = 1
					while answerCounter <= numberOfAnswers
						tempQuestion.set_answer(@lines[counter])
						counter = counter + 1
						answerCounter = answerCounter + 1
					end
					counter = counter + 1
					questionCounter = questionCounter + 1
					arrayOfQuestions << tempQuestion
				end
				arrayOfTests << Generator::TestClass.new(arrayOfQuestions,numberOfQuestions,numberOfAnswers)				
				testCounter = testCounter + 1
				counter = counter + 1
				questionCounter = Integer(1)
			end
			#p arrayOfTests
			return arrayOfTests
		end
	end
end