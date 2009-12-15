require File.join(File.dirname(__FILE__), '..', 'test_helper')

class UserTest < ActiveSupport::TestCase
  should_have_many :archives
  should_have_many :uploads
end
