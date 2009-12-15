class Archive < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :user_id
  validates_uniqueness_of :title, :scope => :user_id

  has_many :uploads
  belongs_to :user

  PUBLIC  = 0
  FRIENDS = 1
  PRIVATE = 2

  acts_as_taggable

  class << self
    def readable_by(user)
      all.select do |archive|
        archive.can_be_read_by?(user)
      end
    end
  end

  def can_be_read_by?(user)
    return true if self.privacy == PUBLIC
    return true if self.privacy == FRIENDS && user && self.owner.friends.include?(user)
    return true if user && (user.admin? || user == self.owner)
    return false
  end

  def owner
    self.user
  end

end
