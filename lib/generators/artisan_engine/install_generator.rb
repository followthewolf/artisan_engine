require 'rails/generators/active_record'

module ArtisanEngine
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base

      argument    :name, :default => 'artisan_engine'
      source_root File.expand_path( '../templates', __FILE__ )

      def install_dependencies
        Rails::Generators.invoke 'artisan_engine:core:install'
        sleep 1 # to prevent duplicate timestamps.
        
        Rails::Generators.invoke 'artisan_engine:auth:install'
        sleep 1 # to prevent duplicate timestamps.
        
        Rails::Generators.invoke 'artisan_engine:commerce:install'
        sleep 1 # to prevent duplicate timestamps.
        
        Rails::Generators.invoke 'artisan_engine:collectability:install'
        sleep 1 # to prevent duplicate timestamps.
        
        Rails::Generators.invoke 'artisan_engine:guidability:install'
        sleep 1 # to prevent duplicate timestamps.
      end
      
      def install_assets
        Rails::Generators.invoke 'artisan_engine:assets'
      end

    end
  end
end