require File.expand_path(File.dirname(__FILE__) + "/luhn.rb")
require File.expand_path(File.dirname(__FILE__) + "/util.rb")

class LuhnValidation

  attr_reader :cc_dirty
  attr_reader :cc_clean

  def initialize
    @cc_clean = []
  end

  def validate(cc_str)
    if cc_str.nil? || cc_str.to_s.empty? 
      false
    else
      @cc_dirty = cc_str.to_s
      @cc_clean = Util.convert_str_to_int_array(@cc_dirty)
      Luhn.compute(@cc_clean)
    end
  end

end
