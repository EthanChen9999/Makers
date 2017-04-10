class AddUserProfile < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :profile, :text
  end
  def down
    remove_column :users, :profile
  end
end
