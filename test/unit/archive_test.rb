require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ArchiveTest < ActiveSupport::TestCase
  should_validate_presence_of :title
  should_validate_presence_of :user_id
  should_validate_uniqueness_of :title
  should_have_many :uploads
  should_belong_to :user
end
