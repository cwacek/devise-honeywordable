
module DeviseHoneywordable
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase

      source_root File.expand_path "../templates", __FILE__
      desc <<RUBY
     Update the provided user model to use honeyword_authenticatable.
     Also creates a migration to create the honeywords table
RUBY

      hook_for :orm,  as: :honeywords, required: true
      #argument :resource_model, :type => :string, :default => "user", :desc => "model to update"

      def update_user_model
        gsub_file "app/models/#{name}.rb",
        /:database_authenticatable/,
          ":honeyword_authenticatable"
      end

    end
  end
end
