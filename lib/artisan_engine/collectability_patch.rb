module ArtisanEngine
  module CollectabilityPatch
    
    def self.included( model )
      model.send :include, ClassMethods
    end

    module ClassMethods
      def self.included( m )
        m.is_collectable
      end
    end
    
  end
end