Gem::Specification.new do |s|
  s.name        = 'artisan_engine'
  s.summary     = 'ArtisanEngine.'
  s.description = 'The whole shebang.'
  s.files       = Dir[ "{ app, config, lib }/**/*" ] + [ "Gemfile" ]
  s.version     = '0.0.1'

  # --------------------- Runtime Dependencies --------------------- #
  ## --------------------------- Basics --------------------------- ##
  
  s.add_runtime_dependency      'artisan_engine_core'
  s.add_runtime_dependency      'artisan_engine_pages'
  s.add_runtime_dependency      'artisan_engine_auth'
  s.add_runtime_dependency      'artisan_engine_commerce'
  s.add_runtime_dependency      'artisan_engine_collectability'
  s.add_runtime_dependency      'artisan_engine_guidability'
  
  # ------------------- Development Dependencies ------------------- #
  
  s.add_development_dependency  'sqlite3',              '1.3.3'
  
  ## ------------------------- Test Suite ------------------------- ##
  
  s.add_development_dependency  'rspec-rails',          '2.5.0'
  s.add_development_dependency  'steak',                '1.1.0'
  s.add_development_dependency  'capybara',             '0.4.1.2'
  s.add_development_dependency  'database_cleaner',     '0.6.7'
  s.add_development_dependency  'launchy',              '0.4.0'
  
  ## -------------------- Sample Data Creation -------------------- ##
  
  s.add_development_dependency  'factory_girl_rails',   '1.0.1'
  s.add_development_dependency  'forgery',              '0.3.8'

end