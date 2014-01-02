require 'fallback_assets'

module FallbackAssets
  module JavascriptsAssets

    def self.fallback_javascript(name)
      load_asset(:javascripts, name)
    end

    def self.load_asset(type, name)
      FallbackAssets.load_asset(type, name)
    end

  end
end
