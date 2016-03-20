source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.1.5'
gem 'pg'
gem 'puma'
gem 'puma-heroku'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc


#my gems
gem 'devise'
gem 'foundation-rails'
gem 'simple_form'
gem 'enum_help' # Used to handle enum fields in simple_form

group :test do
  gem "codeclimate-test-reporter", require: nil
end

group :development do
  gem 'spring'
  gem 'better_errors'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-doc'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
end
