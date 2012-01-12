$: << "."
require_relative '../lib/generator/main'
require_relative '../lib/generator/reader'
require_relative '../lib/generator/question'
require_relative '../lib/generator/test'

#FILENAME = '../files/file.txt'
FILENAME = 'c:\\TEMP\\file.txt'

task = Generator::Main.new
task.setFile(FILENAME)
task.read
task.parseLines
task.makeTest
#task.reader.test_out
