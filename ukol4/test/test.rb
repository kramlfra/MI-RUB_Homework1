require 'test/unit'
require_relative '../lib/decipher/reader'
require_relative '../lib/decipher/main'
require_relative '../lib/decipher/decoder'

#EMPTYFILE = '../files/emptyfile.txt'
#BADFILE = '../files/badfile.txt'
#RIGHTFILE = ''../files/file.txt''

EMPTYFILE = 'c:\\TEMP\\emptyfile.txt'
BADFILE = 'c:\\TEMP\\badfile.txt'
RIGHTFILE = 'c:\\TEMP\\file.txt'

class TestDecipher < Test::Unit::TestCase

	def test_empty_file
		task = DecipherModule::Main.new
		task.setFile(EMPTYFILE)
		assert_raise(ArgumentError){raise ArgumentError.new("basic argument issue")}		
	end
	def test_bad_file
		task = DecipherModule::Main.new
		task.setFile(EMPTYFILE)
		assert_raise(IOError){raise IOError.new("file doesn't exist issue")}		
	end
	def test_reader
		var = Array.new
		var[0] = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5\n"
		var[1] = "1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5\n"
		var[2] = "1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"
		task = DecipherModule::Reader.new(RIGHTFILE)		
		assert_equal( var, task.test_out, "unexpected test text to decode")		
	end
	def test_decoder
		var = Array.new
		res = Array.new
		res[0] = "*CDC is the trademark of the Control Data Corporation."
		res[1] = "*IBM is a trademark of the International Business Machine Corporation."
		res[2] = "*DEC is the trademark of the Digital Equipment Corporation."
		var[0] = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5"
		var[1] = "1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5"
		var[2] = "1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"		
		assert_equal( res, DecipherModule::Decoder.decode(var), "doesn't match")		
	end
end