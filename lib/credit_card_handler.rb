require File.expand_path(File.dirname(__FILE__) + "/luhn.rb")
class CreditCardHandler
  
  attr_reader :cc_dirty_str
  attr_reader :cc_clean_arr
  
  def initialize(cc_str)
    @cc_dirty_str = cc_str.to_s
  end
  
  def process
    convert_str_to_int_array
    if @cc_clean_str.nil? || @cc_clean_str.empty? 
      false
    else
      Luhn.compute(@cc_clean_arr)
    end
  end
  
  def convert_str_to_int_array
    @cc_clean_arr = []
    clean_str
    str_arr = @cc_clean_str.to_s.split('')
    str_arr.each { | i | @cc_clean_arr << i.to_i}
  end

  private
    def clean_str
      @cc_clean_str = @cc_dirty_str.scan(/\d+/).join
    end
end