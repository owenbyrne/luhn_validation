require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + "/../lib/luhn_validation.rb")
require File.expand_path(File.dirname(__FILE__) + '/helper.rb')

class TestLuhnValidation < Test::Unit::TestCase
 
  def test_can_convert_ccstring_intarray
     cc_num = '4444333322221111'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     cc_handler = LuhnValidation.new
     cc_handler.valid?(cc_num)
     assert_equal expected, cc_handler.cc_clean
     expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean[i]}
   end

   def test_can_clean_alpha_characters
     cc_num = '4444-3333-2222-1111'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     cc_handler = LuhnValidation.new
     cc_handler.valid?(cc_num)
     assert_equal expected, cc_handler.cc_clean
     expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean[i]}
   end

   def test_can_clean_special_characters
     cc_num = '4444/3333.2222#1111.!-/!@#$%^&*())_'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     cc_handler = LuhnValidation.new
     cc_handler.valid?(cc_num)
     assert_equal expected, cc_handler.cc_clean
     expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean[i]}
   end

   def test_can_clean_spaces
     cc_num = '4444 3333 2222 1111'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     cc_handler = LuhnValidation.new
     cc_handler.valid?(cc_num)
     assert_equal expected, cc_handler.cc_clean
     expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean[i]}
   end

   def test_can_handle_empty_string
     cc_num = ' '
     expected = []
     cc_handler = LuhnValidation.new
     cc_handler.valid?(cc_num)
     assert_equal expected, cc_handler.cc_clean
     expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean[i]}
   end

   def test_can_handle_nil_string
     cc_num = nil
     expected = []
     cc_handler = LuhnValidation.new
     cc_handler.valid?(cc_num)
     assert_equal expected, cc_handler.cc_clean
     expected.each_index { | i | assert_equal expected[i], cc_handler.cc_clean[i]}
   end
   
  def test_can_process_valid_cc
    val_ccs = Helper.get_valid_test_ccs
    val_ccs.each do | val_cc |
      cc_handler = LuhnValidation.new
      assert cc_handler.valid?(val_cc)
    end
  end
  
  def test_can_process_invalid_cc
    inval_ccs = Helper.get_invalid_test_ccs
    # add some random bad stuff
    inval_ccs << ' '
    inval_ccs << nil
    inval_ccs << '!@#$%^&*(()_{}:"")```~,.|||-_`\\'
    
    inval_ccs.each do | inval_cc |
      cc_handler = LuhnValidation.new
      assert_equal false, cc_handler.valid?(inval_cc), "The following number returned luhn valid #{inval_cc}"
    end
  end
  
  def test_validate_backwards_compatibility
    cc_handler = LuhnValidation.new
    assert cc_handler.respond_to? 'valid?'
    assert cc_handler.respond_to? 'validate'
  end
end