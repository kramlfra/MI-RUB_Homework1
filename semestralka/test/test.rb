require 'test/unit'
require_relative '../lib/generator/reader'
require_relative '../lib/generator/main'
require_relative '../lib/generator/question'
require_relative '../lib/generator/test'

#EMPTYFILE = '../files/emptyfile.txt'
#BADFILE = '../files/badfile.txt'
#RIGHTFILE = ''../files/file.txt''

EMPTYFILE = 'c:\\TEMP\\emptyfile.txt'
BADFILE = 'c:\\TEMP\\badfile.txt'
RIGHTFILE = 'c:\\TEMP\\file.txt'

class TestGenerator < Test::Unit::TestCase

	def test_empty_file
		task = Generator::Main.new
		task.setFile(EMPTYFILE)
		assert_raise(ArgumentError){raise ArgumentError.new("basic argument issue")}		
	end
	
	def test_bad_file
		task = Generator::Main.new
		task.setFile(EMPTYFILE)
		assert_raise(IOError){raise IOError.new("file doesn't exist issue")}		
	end
	
	def test_reader
		var = Array.new
		var[0]="2\n"
		var[1]="3\n"
		var[2]="4\n"
		var[3]="\n"
		var[4]="jak jsi se dnes vyspal?\n"
		var[5]="dobre\n"
		var[6]="spatne\n"
		var[7]="velmi spatne\n"
		var[8]="nespal jsem\n"
		var[9]="\n"
		var[10]="kolik mas deti?\n"
		var[11]="0\n"
		var[12]="1\n"
		var[13]="2\n"
		var[14]="vice\n"
		var[15]="\n"
		var[16]="co je dnes za den?\n"
		var[17]="pondeli\n"
		var[18]="streda\n"
		var[19]="sobota\n"
		var[20]="nevim\n"
		var[21]="\n"
		var[22]="\n"
		var[23]="v kolik rano vstavas?\n"
		var[24]="pred patou\n"
		var[25]="mezi patou sestou\n"
		var[26]="mezi sestou sedmou\n"
		var[27]="po sedme\n"
		var[28]="\n"
		var[29]="jsi retard?\n"
		var[30]="uplny\n"
		var[31]="myslim ze nekdy ano\n"
		var[32]="asi nejsem, ale jisty to neni\n"
		var[33]="nejsem retard\n"
		var[34]="\n"
		var[35]="typ tveho mobilu\n"
		var[36]="dotykovy nejnovejsi\n"
		var[37]="dotykovy stary model\n"
		var[38]="starsi model bez dotykove obrazovky\n"
		var[39]="alternativni zbran"
		task = Generator::Reader.new(RIGHTFILE)		
		assert_equal( var, task.test_out, "unexpected test text was read")
	end
	
	def test_parameters_reader
		task = Generator::Reader.new(RIGHTFILE)	
		assert_equal(2,Integer(task.lines[0]), "unexpected number of tests")
		assert_equal(3,Integer(task.lines[1]), "unexpected number of questions")
		assert_equal(4,Integer(task.lines[2]), "unexpected number of answers")
	end	
	
	def test_questions_in_testClass
		task = Generator::Reader.new(RIGHTFILE)	
		tests = task.parse_lines
		assert_equal("jak jsi se dnes vyspal?\n", tests[0].test[0].question, "unexpected question")
		assert_equal("v kolik rano vstavas?\n", tests[1].test[0].question, "unexpected question")
		assert_equal("typ tveho mobilu\n", tests[1].test[2].question, "unexpected question")		
	end
	
	def test_answers_in_testClass
		task = Generator::Reader.new(RIGHTFILE)	
		tests = task.parse_lines
		assert_equal("alternativni zbran", tests[1].test[2].answers[3], "unexpected answer")
		assert_equal("streda\n", tests[0].test[2].answers[1], "unexpected answer")
		assert_equal("mezi sestou sedmou\n", tests[1].test[0].answers[2], "unexpected answer")
	end
	
	def test_ppt_file_size
		task = Generator::Reader.new(RIGHTFILE)	
		tests = task.parse_lines
		Generator::TestClass.makeTestForPPT(tests)
		myfile = File.new("c:\\PPTTest.xml", "r")
		number = myfile.size
		if(number == 1261)		
			assert_equal(1261,number,"mismatch size of output file (PPTTest.xml)")
		else
			assert_equal(1125,number,"mismatch size of output file (PPTTest.xml)")
		end
	end
	
	def test_latex_file_size
		task = Generator::Reader.new(RIGHTFILE)	
		tests = task.parse_lines
		Generator::TestClass.makeTestLatex(tests)
		myfile = File.new("c:\\LatexTest.tex","r")
		assert_equal(2934, myfile.size, "mismatch size of output file (LatexTest.tex)")
	end
	
end
























