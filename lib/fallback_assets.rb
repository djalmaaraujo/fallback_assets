require "fallback_assets/version"

module FallbackAssets
  module JavascriptsAssets
    def self.javascript_include_fallback(file, fallback)
      (RAILS_ENV != "production") ? fallback : file
    end
  end
end
