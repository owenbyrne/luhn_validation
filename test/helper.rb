class Helper
  TEST_DATA_PATH_BASE = File.expand_path(File.dirname(__FILE__)) + '/test_data'
 
  # returns an array of all valid cc numbers from valid_test_ccs.txts
  def self.get_valid_test_ccs
    self.get_all_file_content(TEST_DATA_PATH_BASE + '/valid_test_ccs.txt')
  end
  
  def self.get_invalid_test_ccs
    self.get_all_file_content(TEST_DATA_PATH_BASE + '/invalid_test_ccs.txt')
  end
  
  private
  def self.get_all_file_content(path)
    contents = []
     File.open(path) do | file |
      while line = file.gets
        contents << line.strip
      end
    end
    contents
  end
end