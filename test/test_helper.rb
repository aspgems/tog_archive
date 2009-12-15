ENV["RAILS_ENV"] = "test"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'config', 'environment'))
require 'test_help'
require 'test/unit'
require 'action_view/test_case'

begin
  gem 'thoughtbot-shoulda', '>=2.10.1'
  require 'shoulda' 
rescue Exception => e
  puts "\n\nYou need shoulda 2.10.1 or greater to test tog_core. Visit http://github.com/thoughtbot/shoulda to view details.\n\n" 
  exit
end

begin
  gem 'mocha', '0.9.7'
  require 'mocha' 
rescue Exception => e
  puts "\n\nYou need mocha 0.9.7 or greater to test tog_core. Visit http://mocha.rubyforge.org to view details.\n\n" 
  exit
end

require 'factory_girl'
require File.expand_path(File.join(File.dirname(__FILE__), 'factories'))

begin require 'redgreen'; rescue LoadError; end

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
