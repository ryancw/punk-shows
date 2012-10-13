source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'thin'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.5'
gem 'jquery_datepicker'
gem 'calendar_date_select', :git => 'http://github.com/paneq/calendar_date_select.git', :branch => 'rails3test'
gem "watu_table_builder", :require => "table_builder"
gem 'event-calendar', :require => 'event_calendar'
gem 'newrelic_rpm'

group :development do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.9.0'
  gem 'guard-rspec', '0.5.5'
  gem 'annotate', '~> 2.4.1.beta'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

# Test gems on Macintosh OS X
group :test do
  gem 'rspec-rails', '2.9.0'
  gem 'capybara', '1.1.2'
  gem 'rb-fsevent', '0.9.2', :require => false
  gem 'growl', '1.0.3'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'factory_girl_rails', '1.4.0'
end 

group :production do
  gem 'pg', '0.12.2'
end