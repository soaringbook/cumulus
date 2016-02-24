source 'https://rubygems.org'

ruby '2.2.4'

# Autoload dotenv in Rails.
# [dotenv-rails](https://github.com/bkeepers/dotenv)
gem 'dotenv-rails', '~> 2.0.2', require: 'dotenv/rails-now', groups: [:development, :test]

# Ruby on Rails is a full-stack web framework optimized for programmer happine
# [rails](http://www.rubyonrails.org)
gem 'rails', '~> 4.2.3'

# Twitter's Bootstrap, converted to Sass and ready to drop into Rails or Compa
# [bootstrap-sass](https://github.com/twbs/bootstrap-sass)
gem "bootstrap-sass", "~> 3.3.5.1"

# I like font-awesome. I like the asset pipeline. I like semantic versioning.
# [font-awesome-rails](https://github.com/bokmann/font-awesome-rails)
gem "font-awesome-rails", "~> 4.4.0.0"

# Sass adapter for the Rails asset pipeline.
# [sass-rails](https://github.com/rails/sass-rails)
gem "sass-rails", "~> 5.0.4"

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org
# [pg](https://bitbucket.org/ged/ruby-pg)
gem 'pg', '~> 0.18.2'

# Uglifier minifies JavaScript files by wrapping UglifyJS to be accessible in
# [uglifier](http://github.com/lautis/uglifier)
gem 'uglifier', '~> 2.7.1'

# CoffeeScript adapter for the Rails asset pipeline.
# [coffee-rails](https://github.com/rails/coffee-rails)
gem 'coffee-rails', '~> 4.1.0'

# This gem provides jQuery and the jQuery-ujs driver for your Rails 4+ applica
# [jquery-rails](http://rubygems.org/gems/jquery-rails)
gem 'jquery-rails', '~> 4.0.4'

# Turbolinks makes following links in your web application faster (use with Ra
# [turbolinks](https://github.com/rails/turbolinks/)
gem 'turbolinks', '~> 2.5.3'

# Forms made easy!
# [simple_form](https://github.com/plataformatec/simple_form)
gem 'simple_form', '~> 3.1.0'

# Haml-rails provides Haml generators for Rails 4. It also enables Haml as the
# [haml-rails](http://github.com/indirect/haml-rails)
gem 'haml-rails', '~> 0.9.0'

# Gretel is a Ruby on Rails plugin that makes it easy yet flexible to create b
# [gretel](http://github.com/lassebunk/gretel)
gem "gretel", "~> 3.0.8"

# Kaminari is a Scope &amp; Engine based, clean, powerful, agnostic, customiza
# [kaminari](https://github.com/amatsuda/kaminari)
gem "kaminari", "~> 0.16.3"

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagic
# [mini_magick](https://github.com/minimagick/minimagick)
gem "mini_magick", "~> 4.2.10"

# Process your uploads in the background by uploading directly to S3
# [carrierwave_direct](https://github.com/dwilkie/carrierwave_direct)
gem "carrierwave_direct", "~> 0.0.15"

# FriendlyId is the "Swiss Army bulldozer" of slugging and permalink plugins f
# [friendly_id](http://github.com/norman/friendly_id)
gem "friendly_id", "~> 5.1.0"

# Call JavaScript code and manipulate JavaScript objects from Ruby. Call Ruby
# [therubyracer](http://github.com/cowboyd/therubyracer)
gem 'therubyracer', '~> 0.12.2'

# Flexible authentication solution for Rails with Warden
# [devise](https://github.com/plataformatec/devise)
gem 'devise', '~> 3.5.2'

# Continuation of the simple authorization solution for Rails which is decoupl
# [cancancan](https://github.com/CanCanCommunity/cancancan)
gem "cancancan", "~> 1.12.0"

# This gem overrides image_tag to support retina resolution images using asset
# [retina_tag](http://github.com/davydotcom/retina_tag)
gem 'retina_tag', '~> 1.3.1'

# A gem to generate xls documents by using rxls templates.
# [spreadsheet_on_rails](https://github.com/10to1/spreadsheet_on_rails)
gem "spreadsheet_on_rails", "~> 1.0.0"

# Create plain old ruby models without reinventing the wheel.
# [active_attr](https://github.com/cgriego/active_attr)
gem "active_attr", "~> 0.8.5"

# Wicked is a Rails engine for producing easy wizard controllers
# [wicked](https://github.com/schneems/wicked)
gem "wicked", "~> 1.2.1"

# Unobtrusive nested forms handling, using jQuery. Use this and discover cocoo
# [cocoon](http://github.com/nathanvda/cocoon)
gem "cocoon", "~> 1.2.6"

# Ruby Adapter for Raygun.io
# [raygun4ruby](http://raygun.io)
gem "raygun4ruby", "~> 1.1.6"

group :development, :test do
  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data
  # [faker](https://github.com/stympy/faker)
  gem 'faker', '~> 1.4.3'

  # Rails application preloader
  # [spring](http://github.com/rails/spring)
  gem 'spring', '~> 1.3.6'
end

group :development, :production do
  # Nokogiri (鋸) is an HTML, XML, SAX, and Reader parser.  Among Nokogiri's
  # [nokogiri](http://nokogiri.org)
  gem "nokogiri", "~> 1.6.6.2"

  # This gem brings you the power of the premailer gem to Rails
  # [premailer-rails](https://github.com/fphilipe/premailer-rails)
  gem "premailer-rails", "~> 1.8.2"
end

group :production do
  # Run Rails the 12factor way
  # [rails_12factor](https://github.com/heroku/rails_12factor)
  gem 'rails_12factor', '~> 0.0.3'

  # Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for
  # [puma](http://puma.io)
  gem 'puma', '~> 2.16.0'

  # Skylight is a smart profiler for Rails apps
  # [skylight](http://www.skylight.io)
  gem "skylight", "~> 0.8.0"
end

group :development do
  # Quiet Assets turns off Rails asset pipeline log.
  # [quiet_assets](http://github.com/evrone/quiet_assets)
  gem "quiet_assets", "~> 1.1.0"

  # Provides a better error page for Rails and other Rack apps. Includes source
  # [better_errors](https://github.com/charliesome/better_errors)
  gem "better_errors", "~> 2.1.1"

  # Use Pry as your rails console
  # [pry-rails](https://github.com/rweng/pry-rails)
  gem "pry-rails", "~> 0.3.4"

  # Brakeman detects security vulnerabilities in Ruby on Rails applications via
  # [brakeman](http://brakemanscanner.org)
  gem "brakeman", "~> 3.1.0", require: false
end

group :test do
  # help to kill N+1 queries and unused eager loading.
  # [bullet](http://github.com/flyerhzm/bullet)
  gem 'bullet', '~> 4.14.7'

  # RSpec for Rails
  # [rspec-rails](http://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.2.2'

  # Launchy is helper class for launching cross-platform applications in a fire
  # [launchy](http://github.com/copiousfreetime/launchy)
  gem "launchy", "~> 2.4.3"

  # Capybara is an integration testing tool for rack based web applications. It
  # [capybara](http://github.com/jnicklas/capybara)
  gem 'capybara', '~> 2.4.4'

  # Test your ActionMailer and Mailer messages in Capybara
  # [capybara-email](https://github.com/dockyard/capybara-email)
  gem 'capybara-email', '~> 2.4.0'

  # Poltergeist is a driver for Capybara that allows you to run your tests on a
  # [poltergeist](http://github.com/teampoltergeist/poltergeist)
  gem "poltergeist", "~> 1.6.0"

  # factory_girl_rails provides integration between
  # [factory_girl_rails](http://github.com/thoughtbot/factory_girl_rails)
  gem 'factory_girl_rails', '~> 4.5.0'

  # Guard::RSpec automatically run your specs (much like autotest).
  # [guard-rspec](https://rubygems.org/gems/guard-rspec)
  gem 'guard-rspec', '~> 4.5.2', require: false

  # Making tests easy on the fingers and eyes
  # [shoulda-matchers](http://thoughtbot.com/community/)
  gem 'shoulda-matchers', '~> 2.8.0'

  # Strategies for cleaning databases. Can be used to ensure a clean state for t
  # [database_cleaner](http://github.com/DatabaseCleaner/database_cleaner)
  gem 'database_cleaner', '~> 1.4.1'

  # Send User Notifications on Mac OS X 10.8 or higher.
  # [terminal-notifier](https://github.com/alloy/terminal-notifier)
  gem 'terminal-notifier', '~> 1.6.3'

  # Send User Notifications on Mac OS X 10.8 - with status icons.
  # [terminal-notifier-guard](https://github.com/Springest/terminal-notifier-guard)
  gem 'terminal-notifier-guard', '~> 1.6.4'

  # Guard::Rubocop automatically checks Ruby code style with RuboCop when files
  # [guard-rubocop](https://github.com/yujinakayama/guard-rubocop)
  gem 'guard-rubocop', '~> 1.2.0'

  # Collects test coverage data from your Ruby test suite and sends it to Code C
  # [codeclimate-test-reporter]()
  gem 'codeclimate-test-reporter', '~> 0.4.7'
end
