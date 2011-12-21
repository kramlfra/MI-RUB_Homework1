$: << "."
require_relative '../lib/decipher/main'
#FILENAME = '../files/file.txt'
FILENAME = 'c:\\TEMP\\file.txt'
# proste to jinak neslo

task = DecipherModule::Main.new
task.setFile(FILENAME)
task.read
task.decode
