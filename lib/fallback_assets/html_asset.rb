require "fallback_assets"

module FallbackAssets
  class HtmlAsset
    def create_script(asset)
      "<script src=\"#{asset}\"></script>"
    end

    def create_link(asset)
      "<link rel=\"stylesheet\" href=\"#{asset}\" />"
    end
  end
end
