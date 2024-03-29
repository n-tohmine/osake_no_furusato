source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Assets
gem 'font-awesome-sass', '~> 5.15.1'
gem 'sassc', '2.1.0'

# Authentication
gem 'sorcery'

# Authorization
gem 'cancancan'

# UI/UX
gem 'rails-i18n'

# SEO
gem 'meta-tags'
gem 'sitemap_generator'
gem 'whenever', require: false

# Configuration
gem 'config'

# Search
gem 'ransack'

# For using Rails variable in JS file
gem 'gon'

# Model
gem 'draper'
gem 'enum_help'

# File_uploader
gem 'aws-sdk-s3', require: false
gem 'carrierwave', '~> 3.0'
gem 'carrierwave-i18n'
gem 'fog-aws'
gem 'mini_magick'

# For googlemap
gem 'geocoder'
gem 'gmaps4rails'

# Pagenation
gem 'kaminari'
gem 'kaminari-i18n'

# Seeds
gem 'seed-fu'
gem 'faker'

# admin
gem 'activeadmin'

group :development, :test do
  # Debugger
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'

  # Check N+1
  gem 'bullet'

  # Testing framework and related
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'solargraph', require: false

  # Email
  gem 'letter_opener_web'
  gem 'net-imap'
  gem 'net-pop'
  gem 'net-smtp'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # For easily check schema and routing info
  gem 'annotate'
  # Lint check, code analyze
  gem 'rails_best_practices'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'fuubar'
  gem 'simplecov', require: false
  gem 'webdrivers', '~> 5.0', require: false
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
