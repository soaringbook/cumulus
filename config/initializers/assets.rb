# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# LESS configuration.
Rails.application.config.less.paths << File.join(Rails.root, 'vendor', 'less')
Rails.application.config.less.compress = true

# Extra layouts.
Rails.application.config.assets.precompile += %w( devise.css )
