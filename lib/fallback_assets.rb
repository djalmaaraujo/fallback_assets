require 'yaml'
require "fallback_assets/version"
# require "fallback_assets/html_asset"

module FallbackAssets
  def self.load(type, name)
    return false unless available_assets.include?(type)
    return false unless type.is_a?(Symbol)
    return false unless name.is_a?(Symbol)

    asset = {type: type.to_s, name: name.to_s}
    asset_from_environment(asset) || asset_from_environment(asset, "development")
  end

  def self.asset_from_environment(asset, env = RAILS_ENV)
    config = settings

    return false unless config["fallbacks"][asset[:type]]
    return false unless config["fallbacks"][asset[:type]][asset[:name]]
    return false unless config["fallbacks"][asset[:type]][asset[:name]][env]

    config["fallbacks"][asset[:type]][asset[:name]][env]
  end

  def self.settings
    YAML.load_file("#{Rails.root}/config/fallback_assets.yml")
  end

  def self.environment
    RAILS_ENV
  end

  def self.available_assets
    [:javascripts, :stylesheets]
  end

  def self.load_javascript(name)
    load(:javascripts, name)
  end

  def self.load_stylesheet(name)
    load(:stylesheets, name)
  end
end
