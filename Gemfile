source 'https://rubygems.org'

ruby file: ".ruby-version"

# Drivers
gem "pg", "~> 1.5"
gem 'redis', '~> 5.0'
gem 'connection_pool'

# Deployment
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem "rails", "~> 7.2.2"
gem 'rack-cors'

# Hotwire
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# rswag
gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'

# Authenticated encryption
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'jwt'

gem 'importmap-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'dotenv-rails'
  gem 'rubocop-rails-omakase', require: false
  gem 'rspec-rails'
  gem 'rswag-specs'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
