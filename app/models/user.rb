class User < ActiveRecord::Base
  has_many :archives
  has_many :uploads

  def friends
    self.profile.friends.map(&:user)
  end
end
