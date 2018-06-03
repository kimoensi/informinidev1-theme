# -*- encoding : utf-8 -*-
# Here you can override or add to the pages in the core website

Rails.application.routes.draw do

  match '/profile/user_address/edit' => 'user_user_address#edit',
        :as => :user_edit_user_address,
        :via => :get

  match '/profile/user_address' => 'user_user_address#update',
        :as => :user_update_user_address,
        :via => :put
end
