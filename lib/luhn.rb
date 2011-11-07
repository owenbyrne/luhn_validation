module Validation
  class Luhn
    
    def self.compute(cc_number)
      if cc_number.nil? || cc_number.empty?
        false
      else
        cc_arr = cc_number
        cc_len = cc_arr.length
        pointer = cc_len - 1
        sum = 0
        cc_len.times do
          if pointer % 2 == cc_len % 2
            n = cc_arr[pointer] * 2
            sum += (n / 10) + (n % 10)
          else
            sum += cc_arr[pointer]
          end
          pointer -= 1
        end
        sum % 10 == 0
      end
    end
  
  end
end