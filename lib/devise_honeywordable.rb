require 'devise_honeywordable/version'

module Devise
  mattr_accessor :honeyword_count
  @@honeyword_count = 20
end

module DeviseHoneywordable
  autoload :Schema, 'devise_honeywordable/schema'

  module Controllers
    autoload :Helpers, 'devise_honeywordable/controllers/helpers'
  end
end


Devise.add_module :honeywordable, :controller => :devise_honeywordable
