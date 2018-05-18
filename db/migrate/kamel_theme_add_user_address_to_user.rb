# -*- encoding : utf-8 -*-
class KamelThemeAddUserAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_address, :string
  end

  def self.down
    remove_column :users, :user_address
  end
end