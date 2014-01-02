require 'spec_helper'
require 'fallback_assets/html_asset'

describe FallbackAssets::HtmlAsset do
  describe "#create_tag" do
    let(:html_asset) { FallbackAssets::HtmlAsset.new }

    it "returns a javascript tag for an loaded javascript asset" do
      expect(html_asset.create_script("jquery.js")).to eq "<script src=\"jquery.js\"></script>"
    end

    it "returns a link tag for an loaded stylesheet asset" do
      expect(html_asset.create_link("normalize.css")).to eq "<link rel=\"stylesheet\" href=\"normalize.css\" />"
    end
  end
end
