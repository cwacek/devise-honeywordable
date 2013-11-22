require 'devise_honeywordable/version'
require 'devise_honeywordable/routes.rb'
require 'devise_honeywordable/model.rb'
require 'pry'

module Devise
  mattr_accessor :honeyword_count
  @@honeyword_count = 20
end

module DeviseHoneywordable


end

Devise.add_module :honeyword_authenticatable,
                  :model => 'devise_honeywordable/model',
                  :route => :session,
                  :controller => :session,
                  :strategy => true
