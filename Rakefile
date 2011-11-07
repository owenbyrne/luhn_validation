require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/test*.rb']
    t.verbose = true
end

task :build do 
  sh %{ gem build luhn_validation.gemspec }
end

task :install do
  sh %{ gem install luhn_validation*.gem}
end

task :uninstall do
  sh %{ gem uninstall luhn_validation }
end

task :clean do
  sh %{ rm luhn_validation*.gem}
end

task :make => [:test, :build]
  
