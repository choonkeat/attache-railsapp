class UseJsonColumns < ActiveRecord::Migration
  class User < ActiveRecord::Base; end

  def up
    add_column :users, :avatar_json, :json
    add_column :users, :photos_json, :json
    User.tap(&:reset_column_information).find_each do |obj|
      obj.avatar_json = JSON.parse(obj[:avatar]) unless obj[:avatar].blank?
      obj.photos_json = JSON.parse(obj[:photos]) unless obj[:photos].blank?
      obj.save!
    end
    remove_column :users, :avatar
    remove_column :users, :photos
    rename_column :users, :avatar_json, :avatar
    rename_column :users, :photos_json, :photos
  end

  def down
    add_column :users, :avatar_json, :text
    add_column :users, :photos_json, :text
    User.tap(&:reset_column_information).find_each do |obj|
      obj.avatar_json = obj[:avatar].to_json unless obj[:avatar].blank?
      obj.photos_json = obj[:photos].to_json unless obj[:photos].blank?
      obj.save!
    end
    remove_column :users, :avatar
    remove_column :users, :photos
    rename_column :users, :avatar_json, :avatar
    rename_column :users, :photos_json, :photos
  end
end
