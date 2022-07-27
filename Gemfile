source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

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
gem 'jquery-rails'

# Authentication
gem 'pundit'
gem 'sorcery'

# UI/UX
gem 'rails-i18n'

# SEO
gem 'meta-tags'
gem 'sitemap_generator'

# Configuration
gem 'config'
gem 'dotenv-rails', require: 'dotenv/rails-now'

# Search
gem 'ransack'

# For using Rails variable in JS file
gem 'gon'

# Model
gem 'enum_help'
gem 'draper'

# File_uploader
gem 'mini_magick'
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-i18n'
gem 'fog-aws'

# For googlemap
gem 'gmaps4rails'
gem 'geocoder'

# Pagenation
gem 'kaminari'
gem 'kaminari-i18n'

# Seeds
gem 'seed-fu'

group :development, :test do
  # Debugger
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'

  # Testing framework and related
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'solargraph', require: false

  # Email
  gem 'letter_opener_web'
  gem 'net-smtp'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # For easily check schema and routing info
  gem 'annotate'
  gem 'migration_comments'
  # Check N+1
  gem 'bullet'
  # Lint check, code analyze
  gem 'rubocop', require: false
  gem 'rails_best_practices'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
  gem 'fuubar'
  gem 'simplecov', require: false
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
