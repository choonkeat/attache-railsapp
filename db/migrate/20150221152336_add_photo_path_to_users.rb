class AddPhotoPathToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo_path, :text
  end
end
