#testing

#require_relative '../bin/startRect'
require_relative '../lib/rect/init'
require_relative '../lib/rect/compare'
require_relative '../lib/rect/rectangle'
require 'test/unit'

class TestResults < Test::Unit::TestCase
	
	def testResult1		
		rectangles = Array.new(0)
		rectangles << RectangleModule::Rectangle.new(0,0,4)
		rectangles << RectangleModule::Rectangle.new(2,2,2)
		rect1 = rectangles[0]
		rect2 = rectangles[1]		
		assert_equal(19, CompareModule.compare(rectangles))
	end
	def testResult2		
		rectangles = Array.new(0)
		rectangles << RectangleModule::Rectangle.new(0.000,0.000e-3,4.0)
		rectangles << RectangleModule::Rectangle.new(-2,-2e0,2.0e+0)
		rect1 = rectangles[0]
		rect2 = rectangles[1]		
		assert_equal(19, CompareModule.compare(rectangles))
	end
	def testResult3	
		rectangles = Array.new(0)
		rectangles << RectangleModule::Rectangle.new(-10e20,3e-2,5.23)
		rectangles << RectangleModule::Rectangle.new(+3e100,-1,4.345643225)
		rect1 = rectangles[0]
		rect2 = rectangles[1]		
		assert_equal(0, CompareModule.compare(rectangles))
	end				
end