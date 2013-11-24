require 'devise_honeywordable/strategy'
require 'bcrypt'
require 'pwqgen'

module Devise
  module Models
    class Honeyword < ActiveRecord::Base
        def self.generate()
          random = Pwqgen.generate(Random.rand(1..3)) + Random.rand(20).to_s
          Honeyword.new encrypted_honeyword: ::BCrypt::Password.create("#{random}").to_s
        end
    end

    module HoneywordAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_reader :password, :current_password
        attr_accessor :password_confirmation

        after_create :save_honeywords_on_create
      end

      # Generates a set of honeywords for the new user
      def password=(new_password)
        @password = new_password
        @passwd= Honeyword.new
        @passwd.encrypted_honeyword = ::BCrypt::Password.create("#{new_password}").to_s

        @honeywords = Array.new(self.class.honeyword_count - 1) {Honeyword.generate}
        @honeywords << @passwd
        @honeywords.shuffle!
      end

      def valid_honeyword?(password)
        return false if password.blank?
        honeywords = Devise::Models::Honeyword.where(auth_id: id).to_a

        honeywords.each do |hw|
          bcrypt = ::BCrypt::Password.new(hw.encrypted_honeyword)
          hashed_pw = ::BCrypt::Engine.hash_secret("#{password}", bcrypt.salt)
          if Devise.secure_compare(hashed_pw, hw.encrypted_honeyword)
            return true
          end
        end
        false
      end

      def clean_up_passwords
          self.password = self.password_confirmation = self.passwd = nil
      end

      protected

      def save_honeywords_on_create
        @honeywords.each_with_index do |hw, i|
          hw.auth_id = self.id
          hw.save
          if hw.encrypted_honeyword == @passwd.encrypted_honeyword
            # Tell the service that this is the  correct one
            # HoneywordAuthService.new_auth self.id, i
          end
        end

        clean_up_passwords

        true
      end

      module ClassMethods
        Devise::Models.config(self, :honeyword_count)

        def authenticate_with_honeywords(conditions)
          auth_key = authentication_keys.first
          return nil unless conditions[auth_key].present?

          auth_key_value = (self.case_insensitive_keys || []).include?(auth_key) ? conditions[auth_key].downcase : conditions[auth_key]

          resource = where(auth_key => auth_key_value).first

          if resource.try(:valid_honeyword?, conditions[:password])
            return resource
          end
          return nil
        end
      end
    end
  end
end


