class Informinidev1ThemeAddUserStatusToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_status, :boolean
  end
  
  def self.down
    remove_column :users, :user_status
  end
end
