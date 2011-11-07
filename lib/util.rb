class Util
  def self.convert_str_to_int_array(cc_num)
    cc_clean_arr = []
    cc_clean_str = clean_str(cc_num)
    str_arr = cc_clean_str.to_s.split('')
    str_arr.each { | i | cc_clean_arr << i.to_i}
    cc_clean_arr
  end

  def self.clean_str(cc_num)
    unless cc_num.nil? || cc_num.empty?
      cc_num.scan(/\d+/).join
    end
  end
end
 