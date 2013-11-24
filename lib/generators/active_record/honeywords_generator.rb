require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class HoneywordsGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def copy_migration
        migration_template "migration.rb", "db/migrate/honeywords_create"
      end

    end
  end
end
