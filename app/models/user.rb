class User < ApplicationRecord
  has_many :messages
  before_save { self.username.downcase! }
  has_secure_password
  validates :username, presence: true,
                   uniqueness: true,
                   length: { minimum: 3, maximum: 10 }
  validates :fullname, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 5, maximum: 25 }
end
