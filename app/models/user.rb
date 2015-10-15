class User < ActiveRecord::Base
  has_one_attache :avatar
  has_many_attaches :photos
  validates_presence_of :name
end
