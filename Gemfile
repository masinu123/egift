source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.7", ">= 7.0.7.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.9'

  # A Ruby gem to load environment variables from `.env`
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'

  # Test
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'rexml', '~> 3.2', '>= 3.2.5'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Authentication
# gem 'jwt', '~> 2.3'
gem 'devise', '~> 4.8'
# gem 'omniauth-google-oauth2', '~> 1.0'
# gem 'omniauth-rails_csrf_protection', '~> 1.0'
# Authorization
gem 'cancancan', '~> 3.3'

# DB
gem 'pg', '~> 1.2', '>= 1.2.3'

# View helpers
gem 'slim-rails', '~> 3.3'
gem 'jquery-rails', '~> 4.4'
gem 'select2-rails', '~> 4.0', '>= 4.0.13'
gem 'simple_form', '~> 5.1'
gem 'nested_form_fields', '~> 0.8.4'
gem 'nested_form', '~> 0.3.2'
gem 'momentjs-rails', '~> 2.20', '>= 2.20.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17', '>= 4.17.47'
gem 'gretel', '~> 4.3'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'bootstrap4-kaminari-views', '~> 1.0', '>= 1.0.1'
gem 'timezone_local', '~> 0.1.5'
gem 'country_select', '~> 6.0'

# Model
gem 'enumerize', '~> 2.4'
gem 'ransack', '~> 2.4', '>= 2.4.2'
gem 'countries', '~> 4.0', '>= 4.0.1'

# Debug tools
gem 'awesome_print', '~> 1.9', '>= 1.9.2'

# Parse json
gem 'oj', '~> 3.13', '>= 3.13.1'