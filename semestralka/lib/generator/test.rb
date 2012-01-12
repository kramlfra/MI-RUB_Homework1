module Generator
	class TestClass
		attr_accessor :numberOfQuestions, :numberOfAnswers, :test
		
		def initialize(arrayOfQuestions,numberOfQuestions,numberOfAnswers)
			@test = arrayOfQuestions	
			@numberOfQuestions = numberOfQuestions
			@numberOfAnswers = numberOfAnswers
		end	
		
		def self.makeTestForPPT(testArray)
			#p testArray
			myfile = File.new("c:\\PPTTest.xml", "w")
			length = testArray.length
			
			puts "\n\t PPT file is just for one test, because modul for " 
			puts "\t PowerPoint cannot handle more then one Test. "
			puts "\t And it would be more interesting when we use random class"
			
			prng = Random.new		
			rand = prng.rand(0...length)
			#p rand
			
			test = testArray[rand]
			#p test
			#puts test.test
			tmp = '<slides count="'
			tmp += String(test.numberOfQuestions)
			tmp += '" id="1234">'
			myfile.puts(tmp)
			questionCounter = 1
			test.test.each do |i|
				question = i
				
				tmp = "\t"
				tmp += '<slide id="'
				tmp += String(questionCounter)
				tmp +='" type="Q" multiresponse="1">'
				myfile.puts(tmp)
				questionCounter = questionCounter + 1
				
				tmp = "\t\t<question>"
				tmp += "\n\t\t\t"
				tmp += String(question.question)
				tmp += "\t\t</question>"
				myfile.puts(tmp)
				
				tmp = "\t\t<topic id=\"2222222\" ></topic>"
				myfile.puts(tmp)
				
				tmp = "\t\t<answers>"
				myfile.puts(tmp)
				answerCounter = 1
				#answerCount = test.numberOfAnswers
				question.answers.each do |j|
					tmp = "\t\t\t"
					tmp += '<answer value="'
					tmp += String(answerCounter)
					tmp += '">'
					tmp += "\n\t\t\t\t"
					tmp += j
					tmp += "\t\t\t</answer>"
					myfile.puts(tmp)
					answerCounter = answerCounter + 1				
				end
				
				tmp = "\t\t</answers>"
				myfile.puts(tmp)
				
				tmp = "\t</slide>"
				myfile.puts(tmp)						
			
			end
			
			tmp = '</slides>'
			myfile.puts(tmp)
			puts "\n\tInput file for PowerPoint was genareted and its location: \n\tC:\\LatexTest.tex"
			myfile.close
		end
		
		
		def self.makeTestLatex(testArray)
			myfile = File.new("c:\\LatexTest.tex", "w")
			length = testArray.length
			abeceda = ['a','b','c','d','e','f','g','h','i']
			puts "\n\t Latex file contains all tests, each test has special head,"
			puts "\t which defines begining of test"
			
			myfile.puts(self.topSettings)
			
			testArray.each do |testik|
				myfile.puts(self.head)
				testik.test.each do |question|
					tmp = "\t"
					tmp += '\large{\item '
					tmp += String(question.question)
					tmp += ' \\}'
					tmp += "\n"
					tmp += '\hrule'
					tmp += "\n"
					tmp += '\begin{description}'
					myfile.puts(tmp)
					
					counter = 0
					question.answers.each do |answer|
						tmp = ' \item['
						tmp += String(abeceda[counter])
						tmp += '] '
						tmp += String(answer)
						myfile.puts(tmp)
						counter = counter + 1
					end
					
					tmp = '\end{description}'
					tmp += "\n"
					tmp += '\hrule'
					tmp += "\n"
					myfile.puts(tmp)
				end
				
				tmp = '\end{enumerate}'
				tmp += "\n"
				tmp +='\newpage'
				myfile.puts(tmp)
				
			end
			
			tmp = '\end}document}'
			myfile.puts(tmp)
			
			puts "\n\tInput Latex file was genareted and its location: \n\tC:\\PPTTest.xml"
			myfile.close
			
		end
		def self.topSettings
			tmp = ' \documentclass[czech,a4paper,22pt]{article}'
			tmp += "\n"
			tmp += ' \setlength{\topmargin}{-3.54cm}'
			tmp += "\n"
			tmp += ' \setlength{\oddsidemargin}{-1cm}'
			tmp += "\n"
			tmp += ' \setlength{\evensidemargin}{-1cm}'
			tmp += "\n"
			tmp += ' \setlength{\textwidth}{17.5cm}'
			tmp += "\n"
			tmp += ' \setlength{\textheight}{25.5cm}'
			tmp += "\n"
			tmp += ''
			tmp += "\n"
			tmp += ' \usepackage[czech]{babel}'
			tmp += "\n"
			tmp += ' \usepackage[utf8]{inputenc}'
			tmp += "\n"
			tmp += ' \usepackage{graphicx}'
			tmp += "\n"
			tmp += ' \usepackage{subfigure}'
			tmp += "\n"
			tmp += ' \usepackage{picins}'
			tmp += "\n"
			tmp += ' \usepackage{amsmath}'
			tmp += "\n"
			tmp += ' \usepackage{color}'
			tmp += "\n"
			tmp += ' \usepackage{latexsym}'
			tmp += "\n"
			tmp += ''
			tmp += "\n"
			tmp += ' \def\modre#1{\textcolor{blue}{#1}}'
			tmp += "\n"
			tmp += ' \def\algn#1{\mbox{\sc #1}}'
			tmp += "\n"
			tmp += ' \def\pp{\hglue 2em}'
			tmp += "\n"
			tmp += ' \def\kw#1{{\bf #1}}'
			tmp += "\n"
			tmp += ' \begin{document}'
			tmp += "\n"
			
			return tmp
		end
		
		def self.head
			tmp = '{\small'
			tmp += "\n"
			tmp += '\begin{tabular}{p{.6\textwidth}p{.25\textwidth}}'
			tmp += "\n\n"
			tmp += '~'
			tmp += "\n\n"
			tmp += '\LARGE{\bf A}'
			tmp += "\n\n"
			tmp += '\includegraphics[width=10cm]{hlavicka.pdf}'
			tmp += "\n"
			tmp += '    &'
			tmp += "\n"
			tmp += '\begin{tabbing}'
			tmp += "\n"
			tmp += '  \hspace{1.5cm} \= \hspace{2cm} \= \ '
			tmp += "\n"
			tmp += '   Prijmeni: \> '
			tmp += "\n"
			tmp += '\rule{3cm}{.1mm}\[.3cm]'
			tmp += "\n"
			tmp += '   Jmeno:  \> '
			tmp += "\n"
			tmp += '\rule{3cm}{.1mm}\[.3cm]'
			tmp += "\n"
			tmp += '   Cvicici:  '
			tmp += "\n"
			tmp += '   \> $\Box$ Matyas \> $\Box$ Chludil\[.3cm]'
			tmp += "\n"
			tmp += '   Skupina: '
			tmp += "\n"
			tmp += '   \> $\Box$ ct, 12:45 \> $\Box$ st, 12:45 \ '
			tmp += "\n"
			tmp += '   \> $\Box$ ct, 14:30 \> $\Box$ st, 14:30 \ '
			tmp += "\n"
			tmp += '   \> $\Box$ ct, 16:15 \> $\Box$ st, 16:15 \ '
			tmp += "\n"
			tmp += '   \> $\Box$ ct, 18:00 \> $\Box$ st, 18:00 \ '
			tmp += "\n\n"   
			tmp += '\end{tabbing}'
			tmp += "\n"
			tmp += '\end{tabular}'
			tmp += "\n"
			tmp += '}'
			tmp += "\n"
			tmp += '\begin{enumerate}'
			tmp += "n"
			
			return tmp
		end
		
	end
end


























