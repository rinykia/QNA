source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'carrierwave'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'slim-rails'
gem 'devise'
gem 'launchy'
gem 'remotipart' #избегает ошибку ActionController::InvalidAuthenticityToken
gem 'private_pub'
gem 'thin'
gem 'inherited_resources'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'responders'
gem 'cancancan'
gem 'pundit'
gem 'doorkeeper'
gem 'active_model_serializers', '~> 0.10.0'
gem 'oj'
gem 'oj_mimic_json'
#gem 'delayed_job_active_record'
gem 'whenever'
gem 'sidekiq'
gem 'sinatra', '>=1.3.0', require: nil
gem 'sidetiq'
gem 'mysql2'
gem 'thinking-sphinx'
gem 'redis-rails'
#gem 'redis-throttle', git: 'git@github.com:andreareginato/redis-throttle.git'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails', '4.2.1'
  #gem 'selenium-webdriver' заменен на gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'json_spec'
end


group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
end

