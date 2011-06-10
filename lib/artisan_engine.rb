for engine in %w( core pages auth commerce collectability guidability )
  require "artisan_engine/#{ engine }"
end

require 'artisan_engine'

module ArtisanEngine

  autoload :CollectabilityPatch, 'artisan_engine/collectability_patch'
  autoload :GuidabilityPatch, 'artisan_engine/guidability_patch'
  
  # ------------------------- Vroom vroom! ------------------------- #
  
  class Engine < Rails::Engine
    initializer 'configure Collectability' do
      ArtisanEngine::Collectability.collectable_models += [ :good ]
    end
    
    initializer 'configure Guidability' do
      ArtisanEngine::Guidability.guidable_models += [ :custom_collection ]
    end
    
    config.to_prepare do      
      ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :artisan_engine => [ "artisan_engine/back" ]
      
      CustomCollection.send :include, ArtisanEngine::GuidabilityPatch
      Good.send :include, ArtisanEngine::CollectabilityPatch
    end
  end

end