class AddAvatarAndPhotosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :text
    add_column :users, :photos, :text
  end
end
