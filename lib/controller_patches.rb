# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
    
    
    UserController.class_eval do
        private
        
        def user_params(key = :user)
            params[key].slice(:name,
                              :email,
                              :user_address,
                              :user_status,  
                              :password,
                              :password_confirmation)
        end

    end
  
end
