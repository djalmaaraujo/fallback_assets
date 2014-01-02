require "fallback_assets"

module FallbackAssets
  class HtmlAsset
    def initialize(asset)
      @asset = asset
    end

    def create_script
      "<script src=\"#{@asset}\"></script>"
    end

    def create_link
      "<link rel=\"stylesheet\" href=\"#{@asset}\" />"
    end
  end
end
