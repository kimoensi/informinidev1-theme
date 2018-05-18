# -*- encoding : utf-8 -*-
# Uninstall hook code here
def table_exists?(table)
  ActiveRecord::Base.connection.table_exists?(table)
end

def column_exists?(table, column)
  if table_exists?(table)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end

if ENV['REMOVE_MIGRATIONS']
  # Remove the identity_card_number field to the User model
  if column_exists?(:users, :user_address)
    migration_file_path = '../db/migrate/kamel_theme_add_user_address_to_user'
    require File.expand_path migration_file_path, __FILE__
    KamelThemeAddUserAddressToUser.down
  end
end
