# -*- encoding : utf-8 -*-
class Informinidev1ThemeAddUserAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_address, :string
  end
  
  def self.down
    remove_column :users, :user_address
  end
end

class Informinidev1ThemeAddUserStatusToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_status, :boolean
  end
  
  def self.down
    remove_column :users, :user_status
  end
end
