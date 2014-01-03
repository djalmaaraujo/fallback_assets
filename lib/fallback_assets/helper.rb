require 'fallback_assets'

module FallbackAssets
  module Helper
    def fallback_stylesheet(name)
      asset = FallbackAssets::load_stylesheet(name)

      FallbackAssets::HtmlAsset.new(asset).create_link
    end

    def fallback_javascript(name)
      asset = FallbackAssets::load_javascript(name)

      FallbackAssets::HtmlAsset.new(asset).create_script
    end

  end
end
