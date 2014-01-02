require 'fallback_assets'

module FallbackAssets
  module StylesheetsAssets

    def self.fallback_stylesheet(name)
      FallbackAssets.load(:stylesheets, name)
    end

  end
end
