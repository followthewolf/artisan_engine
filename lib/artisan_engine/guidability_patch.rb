module ArtisanEngine
  module GuidabilityPatch
    
    def self.included( model )
      model.send :include, ClassMethods
    end

    module ClassMethods
      def self.included( m )
        m.is_guidable
      end
    end
    
  end
end