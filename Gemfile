# A sample Gemfile
source "https://rubygems.org"

# base framework
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

# api
gem 'grape'

# frontend stacks
gem 'bootstrap-sass'
gem 'coffee-script'
gem 'sass', :require => 'sass'
gem 'uglifier'
gem 'haml'
gem 'sprockets'
gem 'sprockets-helpers'
gem 'sprockets-sass'

# Webserver
gem 'unicorn'

# development kit
group :test, :development do
  gem 'sqlite3'
  gem 'minitest'
  gem 'rake'
  gem 'shotgun'
  gem 'tux'
  gem 'coveralls', require: false
end

# production db
group :production do
  gem 'pg'
end
