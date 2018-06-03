# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  
  User.class_eval do
    
    validates :user_address,
              :presence => {
                :message => _('Please enter your address')
              },
              :format => {
                :with => /\s/,
                :message => _("Please enter your address - it is required by law when making a request"),
                :allow_blank => true
              }
    
    validates :name,
              :format => {
                :with => /\s/,
                :message => _("Please enter your full name - it is required by law when making a request"),
                :allow_blank => true
              }
    
    # The "internal admin" is a special user for internal use.
    def self.internal_admin_user
        user = User.find_by_email(AlaveteliConfiguration::contact_email)
        if user.nil?
            password = PostRedirect.generate_random_token
            user = User.new(
                :name => 'Internal admin user',
                :email => AlaveteliConfiguration.contact_email,
                :password => password,
                :password_confirmation => password,
                :user_address => 'Adresse de test',
                :user_status => 'PM'
            )
            user.save!
        end

        user
    end
  end    
end
