require 'yaml'
require "fallback_assets/version"
require 'fallback_assets/javascripts_assets'
require 'fallback_assets/stylesheets_assets'

module FallbackAssets
  include FallbackAssets::JavascriptsAssets
  include FallbackAssets::StylesheetsAssets

  def self.load_asset(type, name)
    asset = {type: type.to_s, name: name.to_s}
    asset_from_environment(asset) || asset_from_environment(asset, "development")
  end

  def self.asset_from_environment(asset, env = RAILS_ENV)
    config = settings
    config["fallbacks"][asset[:type]][asset[:name]][env]
  end

  def self.settings
    YAML.load_file("#{Rails.root}/config/fallback_assets.yml")
  end

  def self.environment
    RAILS_ENV
  end

end
