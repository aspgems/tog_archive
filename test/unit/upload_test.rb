require File.join(File.dirname(__FILE__), '..', 'test_helper')

class UploadTest < ActiveSupport::TestCase
  should_belong_to :user
  should_belong_to :archive
end
