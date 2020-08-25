class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :medium
  validates_presence_of :link
  validates_presence_of :user
end
