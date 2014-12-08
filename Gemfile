
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'

# Use sqlite as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# to use a dryer head-layer to HTML/XML than erb
gem 'haml', '~> 4.0.6'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use thin as the lightwight app server
gem 'thin'

# Use byebug / to stop and analyze the app at any given state in development / debugger replacement in R2.0
gem 'byebug', group: [:development, :test]

# get helpful gems for unit and integration testing
group :development, :test do
  gem "rspec-rails", ">= 2.0.1"
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

# to give it a decent look
gem 'foundation-rails'

# to write more concise code
gem "haml-rails"

# delayed job for background task handling, not optimal as it uses active records but 
# it doesn't need a redis installation and therefore is easier to deploy by someone else
gem 'delayed_job_active_record'

# pagination
gem 'alphabetical_paginate'

# cronjob based job scheduling
gem 'rufus-scheduler'
