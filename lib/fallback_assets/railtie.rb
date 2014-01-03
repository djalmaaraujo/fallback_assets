require 'fallback_assets'
require 'fallback_assets/helper'

module FallbackAssets
  class FallbackAssetsRailtie < Rails::Railtie
    ActiveSupport.on_load(:action_view) do
      include FallbackAssets::Helper
    end
  end
end
