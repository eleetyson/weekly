class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates_uniqueness_of :username, message: "Sorry, that username already exists. Let's try something different"
end
