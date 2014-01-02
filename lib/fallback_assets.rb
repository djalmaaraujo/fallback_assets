require "fallback_assets/version"
require 'fallback_assets/javascripts_assets'
require 'fallback_assets/stylesheets_assets'

module FallbackAssets
  include FallbackAssets::JavascriptsAssets
  include FallbackAssets::StylesheetsAssets

end
