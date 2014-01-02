require 'fallback_assets'

module FallbackAssets
  module JavascriptsAssets

    def self.fallback_javascript(name)
      FallbackAssets.load(:javascripts, name)
    end

  end
end
