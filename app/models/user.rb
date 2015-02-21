class User < ActiveRecord::Base
  serialize :photo_path, JSON
end
