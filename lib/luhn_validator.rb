require File.expand_path(File.dirname(__FILE__) + "/luhn.rb")
require File.expand_path(File.dirname(__FILE__) + "/util.rb")
module Validation
  class LuhnValidator
  
    attr_reader :cc_dirty_str
    attr_reader :cc_clean_arr
  
    def initialize
      @cc_clean_arr = []
    end
  
    def validate(cc_str)
      if cc_str.nil? || cc_str.empty? 
        false
      else
        @cc_dirty_str = cc_str.to_str
        @cc_clean_arr = Util.convert_str_to_int_array(@cc_dirty_str)
        Luhn.compute(@cc_clean_arr)
      end
    end

  end
end