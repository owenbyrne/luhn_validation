require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/luhn.rb')
require File.expand_path(File.dirname(__FILE__) + '/../lib/luhn_validator.rb')
require File.expand_path(File.dirname(__FILE__) + '/helper.rb')
include Validation

class TestLuhn < Test::Unit::TestCase
  
  def test_valid_lunh_number_should_pass
    vlns = Helper.get_valid_test_ccs
    vlns.each do |val_luhn|
      #cc_handler = LuhnValidator.new(val_luhn)
      #cc_handler.convert_str_to_int_array
      assert Luhn.compute(Util.convert_str_to_int_array(val_luhn)), "The following number returned luhn invalid #{val_luhn}"
    end
  end
  
  def test_invliad_number_should_fail
    invlns = Helper.get_invalid_test_ccs
    invlns.each do |inval_luhn|
        #cc_handler = LuhnValidator.new(inval_luhn)
        #cc_handler.convert_str_to_int_array
        #cc_handler.cc_clean_arr
      assert_equal false, Luhn.compute(Util.convert_str_to_int_array(inval_luhn)), "The following number returned luhn valid #{inval_luhn}"
    end
  end
end