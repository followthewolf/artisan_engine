source 'http://rubygems.org'
gemspec

gem 'rake', '~> 0.8.7'

if ENV['BUNDLE_ENV'] == "dev"
	gem 'artisan_engine_core',					:path => 'core'
	gem 'artisan_engine_pages',				:path => 'pages'
	gem 'artisan_engine_auth',					:path => 'auth'
	gem 'artisan_engine_commerce',			:path => 'commerce'
	gem 'artisan_engine_collectability',	:path => 'collectability'
	gem 'artisan_engine_guidability',		:path => 'guidability'
else
	gem 'artisan_engine_core',					:git => 'git@github.com:followthewolf/artisan_engine_core.git'
	gem 'artisan_engine_pages',				:git => 'git@github.com:followthewolf/artisan_engine_pages.git'
	gem 'artisan_engine_auth',					:git => 'git@github.com:followthewolf/artisan_engine_auth.git'
	gem 'artisan_engine_commerce',			:git => 'git@github.com:followthewolf/artisan_engine_commerce.git'
	gem 'artisan_engine_collectability',	:git => 'git@github.com:followthewolf/artisan_engine_collectability.git'
	gem 'artisan_engine_guidability',		:git => 'git@github.com:followthewolf/artisan_engine_guidability.git'
end