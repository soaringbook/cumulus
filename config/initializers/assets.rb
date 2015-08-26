# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Font configuration.
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')  
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

# LESS configuration.
Rails.application.config.less.paths << File.join(Rails.root, 'app', 'assets', 'less')
Rails.application.config.less.compress = true

# Extra layouts.
Rails.application.config.assets.precompile += %w( devise.css devise.js )
Rails.application.config.assets.precompile += %w( errors.css )

