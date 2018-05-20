# -*- encoding : utf-8 -*-
# This file is executed in the Rails evironment by the `rails-post-install` script
def table_exists?(table)
  ActiveRecord::Base.connection.table_exists?(table)
end

def column_exists?(table, column)
  if table_exists?(table)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end

# Add the user_status field to the User model
unless column_exists?(:users, :user_status)
  migration_file_path = '../db/migrate/informinidev1_theme_add_user_status_to_user'
  require File.expand_path migration_file_path, __FILE__
  Informinidev1ThemeAddUserStatusToUser.up
end

# Add the user_address field to the User model
unless column_exists?(:users, :user_address)
  migration_file_path = '../db/migrate/Informinidev1_theme_add_user_address_to_user'
  require File.expand_path migration_file_path, __FILE__
  Informinidev1ThemeAddUserAddressToUser.up
end
