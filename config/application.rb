require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cumulus
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Configure generators.
    config.generators do |g|
      g.test_framework :rspec, fixture: true, views: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.helper false
      g.assets false
    end

    config.action_mailer.default_url_options = { host: ENV['CUMULUS_DEFAULT_URL_HOST'] }
    config.action_mailer.asset_host = ENV['CUMULUS_DEFAULT_URL_HOST']
    config.action_controller.asset_host = ENV['CUMULUS_DEFAULT_URL_HOST']

    config.exceptions_app = routes

    # Mailer
    ActionMailer::Base.smtp_settings = {
      address:               'smtp.sendgrid.net',
      port:                  '587',
      authentication:        :plain,
      user_name:             ENV['SENDGRID_USERNAME'],
      password:              ENV['SENDGRID_PASSWORD'],
      domain:                'heroku.com',
      enable_starttls_auto:  true
    }

    config.to_prepare do
      Devise::Mailer.layout "mailer"
      Devise::ConfirmationsController.layout "application"

      Devise::SessionsController.skip_before_filter :redirect_to_payments_if_needed
      Devise::RegistrationsController.skip_before_filter :redirect_to_payments_if_needed
      Devise::ConfirmationsController.skip_before_filter :redirect_to_payments_if_needed
      Devise::PasswordsController.skip_before_filter :redirect_to_payments_if_needed
    end
  end
end
