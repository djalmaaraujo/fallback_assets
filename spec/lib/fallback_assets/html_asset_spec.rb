require 'spec_helper'
require 'fallback_assets/html_asset'

describe FallbackAssets::HtmlAsset do
  describe "#create_tag" do
    it "returns a javascript tag for an loaded javascript asset" do
      expect(FallbackAssets::HtmlAsset.new("jquery.js").create_script).to eq "<script src=\"jquery.js\"></script>"
    end

    it "returns a link tag for an loaded stylesheet asset" do
      expect(FallbackAssets::HtmlAsset.new("normalize.css").create_link).to eq "<link rel=\"stylesheet\" href=\"normalize.css\" />"
    end
  end
end
