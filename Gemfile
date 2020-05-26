source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Authentication solution
gem 'devise', '~> 4.7.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sassc-rails'
gem 'bootstrap-sass'
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Icons
gem "font-awesome-rails"

# Authorization
gem "pundit"

# DB
gem 'pg', '1.1.4'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'pry-rails'

# Use Active Storage variant
gem 'active_storage_drag_and_drop'
gem "mini_magick"
gem "image_processing"


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.6', require: false

gem 'webpacker',  '4.0.7'

group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'active_storage_validations'
  gem 'faker'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
