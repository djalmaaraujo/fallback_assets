require 'fallback_assets'

module FallbackAssets
  module StylesheetsAssets

    def self.fallback_stylesheet(name)
      load_asset(:stylesheets, name)
    end

    def self.load_asset(type, name)
      FallbackAssets.load_asset(type, name)
    end

  end
end
