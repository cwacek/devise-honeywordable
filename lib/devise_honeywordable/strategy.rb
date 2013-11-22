require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class HoneywordAuthenticatable < Authenticatable

      def authenticate!
        resource = valid_password? && mapping.to.authenticate_with_honeywords(authentication_hash.merge(password: password))

        return fail(:invalid) unless resource

        if validate(resource)
          success!(resource)
        end
        fail!(:invalid)
      end
    end
  end
end

Warden::Strategies.add(:honeyword_authenticatable,
                       Devise::Strategies::HoneywordAuthenticatable)
