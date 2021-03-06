class User < ApplicationRecord
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :admin, ->{where(:admin, true)}
  before_save { self.username = self.username.to_s.downcase }

end
