require 'spec_helper'
require 'steak'

# ---------------------- Load Support Files ---------------------- #

include ArtisanEngine::Auth::TestHelpers::Integration
include ArtisanEngine::Attachments::TestHelpers::Integration
include ArtisanEngine::Catalog::TestHelpers::Integration
include ArtisanEngine::Collectability::TestHelpers::Integration
include ArtisanEngine::Guidability::TestHelpers::Integration
include ArtisanEngine::Commerce::TestHelpers::Integration

Dir[ "#{ File.dirname( __FILE__ ) }/support/**/*.rb" ].each { |f| require f }