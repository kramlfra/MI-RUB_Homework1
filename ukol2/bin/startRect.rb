#startRect version 1.00
require_relative '../lib/rect/init'
require_relative '../lib/rect/compare'

rectangles = Init.run
#p rectangles
CompareModule.compare(rectangles)

