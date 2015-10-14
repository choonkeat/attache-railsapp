# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << 'vendor/assets/components'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile +=
  Dir['vendor/assets/components/**/*.{otf,svg,woff,woff2,eot,ttf}'].collect do |path|
    path['vendor/assets/components/'.length..-1]
  end
