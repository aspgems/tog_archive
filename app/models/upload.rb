class Upload < ActiveRecord::Base
  belongs_to :user
  belongs_to :archive

  acts_as_taggable
  acts_as_voteable
  acts_as_commentable

  has_attached_file :upload

  validates_attachment_presence :upload

  delegate :can_be_read_by?, :to => :archive
end
