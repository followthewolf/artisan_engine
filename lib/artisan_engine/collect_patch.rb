module ArtisanEngine
  module CollectPatch
    
    def self.included( model )
      model.send :include, ClassMethods
    end

    module ClassMethods
      def self.included( m )
        m.has_many :guide_links, :as => :guidable, :dependent => :destroy
      end
    end
    
  end
end