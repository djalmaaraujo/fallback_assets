require 'yaml'
require "fallback_assets/version"
require 'fallback_assets/javascripts_assets'
require 'fallback_assets/stylesheets_assets'

module FallbackAssets
  include FallbackAssets::JavascriptsAssets
  include FallbackAssets::StylesheetsAssets

  def self.load_asset(type, asset)
    config = settings
    config["fallbacks"][type.to_s][asset.to_s][environment]
  end

  def self.settings
    YAML.load_file("#{Rails.root}/config/fallback_assets.yml")
  end

  def self.environment
    RAILS_ENV
  end

end
