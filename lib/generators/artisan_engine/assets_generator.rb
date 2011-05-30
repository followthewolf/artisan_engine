require 'rails/generators/active_record'

module ArtisanEngine
  module Generators
    class AssetsGenerator < ActiveRecord::Generators::Base
      argument    :name, :default => 'artisan_engine_assets'
      source_root File.expand_path( '../templates', __FILE__ )

      def copy_assets
        template 'assets/artisan_engine_front-datauri.css', 
                 'public/stylesheets/artisan_engine/artisan_engine_front.css'
        
        template 'assets/artisan_engine_back-datauri.css', 
                 'public/stylesheets/artisan_engine/artisan_engine_back.css'
        
        template 'assets/artisan_engine_print-datauri.css', 
                 'public/stylesheets/artisan_engine/artisan_engine_print.css'
        
        template 'assets/artisan_engine_ie-datauri.css',
                 'public/stylesheets/artisan_engine/artisan_engine_ie.css'

        template 'assets/artisan_engine_all.js',
                 'public/javascripts/artisan_engine/artisan_engine_all.js'
      
        directory 'assets/images',
                  'public/images'
      end
      
      def copy_layout
        template 'layouts/front.html.haml',
                 'app/views/layouts/front.html.haml'
                 
        template 'layouts/_head.html.haml',
                 'app/views/layouts/_head.html.haml'

        template 'layouts/manage/_head.html.haml',
                 'app/views/layouts/manage/_head.html.haml'
      end
    end
  end
end