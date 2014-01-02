require 'fallback_assets'

module FallbackAssets
  module StylesheetsAssets
    def self.stylesheet_include_fallback(file, fallback)
      (RAILS_ENV != "production") ? fallback : file
    end
  end
end
