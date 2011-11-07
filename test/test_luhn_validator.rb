require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + "/../lib/luhn_validator.rb")
require File.expand_path(File.dirname(__FILE__) + '/helper.rb')
include Validation
class TestLuhnValidator < Test::Unit::TestCase
  def test_can_convert_ccstring_intarray
    cc_num = '4444333322221111'
    expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
    cc_handler = LuhnValidator.new(cc_num)
    cc_handler.convert_str_to_int_array
    assert_equal expected, cc_handler.cc_clean_arr
    expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean_arr[i]}
  end
  
  def test_can_clean_alpha_characters
    cc_num = '4444-3333-2222-1111'
    expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
    cc_handler = LuhnValidator.new(cc_num)
    cc_handler.convert_str_to_int_array
    assert_equal expected, cc_handler.cc_clean_arr
    expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean_arr[i]}
  end
  
  def test_can_clean_special_characters
    cc_num = '4444/3333.2222#1111.!-/!@#$%^&*())_'
    expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
    cc_handler = LuhnValidator.new(cc_num)
    cc_handler.convert_str_to_int_array
    assert_equal expected, cc_handler.cc_clean_arr
    expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean_arr[i]}
  end
  
  def test_can_clean_spaces
    cc_num = '4444 3333 2222 1111'
    expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
    cc_handler = LuhnValidator.new(cc_num)
    cc_handler.convert_str_to_int_array
    assert_equal expected, cc_handler.cc_clean_arr
    expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean_arr[i]}
  end
  
  def test_can_handle_empty_string
    cc_num = ' '
    expected = []
    cc_handler = LuhnValidator.new(cc_num)
    cc_handler.convert_str_to_int_array
    assert_equal expected, cc_handler.cc_clean_arr
    expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean_arr[i]}
  end
  
  def test_can_handle_nil_string
    cc_num = nil
    expected = []
    cc_handler = LuhnValidator.new(cc_num)
    cc_handler.convert_str_to_int_array
    assert_equal expected, cc_handler.cc_clean_arr
    expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean_arr[i]}
  end
  
  def test_can_process_valid_cc
    val_ccs = Helper.get_valid_test_ccs
    val_ccs.each do | val_cc |
      cc_handler = LuhnValidator.new(val_cc)
      assert cc_handler.process
    end
  end
  
  def test_can_process_invalid_cc
    inval_ccs = Helper.get_invalid_test_ccs
    # add some random bad stuff
    inval_ccs << ' '
    inval_ccs << nil
    inval_ccs << '!@#$%^&*(()_{}:"")```~,.|||-_`\\'
    
    inval_ccs.each do | inval_cc |
      cc_handler = LuhnValidator.new(inval_cc)
      assert_equal false, cc_handler.process
    end
  end
end