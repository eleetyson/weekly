class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates_presence_of :name, :username, :password
  validates_uniqueness_of :username, message: "is taken"
end
