require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + "/../lib/util.rb")
require File.expand_path(File.dirname(__FILE__) + '/helper.rb')

class TestUtil < Test::Unit::TestCase
  def test_can_convert_ccstring_intarray
     cc_num = '4444333322221111'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     actual = Util.convert_str_to_int_array(cc_num)
     assert_equal expected, actual
   end

   def test_can_clean_alpha_characters
     cc_num = '4444-3333-2222-1111'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     actual = Util.convert_str_to_int_array(cc_num)
     assert_equal expected, actual
   end

   def test_can_clean_special_characters
     cc_num = '4444/3333.2222#1111.!-/!@#$%^&*())_'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     actual = Util.convert_str_to_int_array(cc_num)
     assert_equal expected, actual
   end

   def test_can_clean_spaces
     cc_num = '4444 3333 2222 1111'
     expected = [4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
     actual = Util.convert_str_to_int_array(cc_num)
     assert_equal expected, actual
   end

   def test_can_handle_empty_string
     cc_num = ' '
     expected = []
     actual = Util.convert_str_to_int_array(cc_num)
     assert_equal expected, actual
   end

   def test_can_handle_nil_string
     cc_num = nil
     expected = []
     actual = Util.convert_str_to_int_array(cc_num)
     assert_equal expected, actual
   end
end