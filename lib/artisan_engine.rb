for engine in %w( core pages auth commerce collectability guidability )
  require "artisan_engine/#{ engine }"
end

require 'artisan_engine'

module ArtisanEngine

  # ------------------------- Vroom vroom! ------------------------- #
  
  class Engine < Rails::Engine
    config.to_prepare do      
      ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :artisan_engine => [ "artisan_engine/back" ]
    end
    
    initializer 'configure Collectability' do
      ArtisanEngine::Collectability.collectable_models += [ :good ]
    end
    
    initializer 'configure Guidability' do
      ArtisanEngine::Guidability.guidable_models += [ :custom_collection ]
    end
  end

end