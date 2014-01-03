require 'spec_helper'

require 'fallback_assets/helper'

describe FallbackAssets::Helper do
  let(:settings) { YAML.load_file("spec/fixtures/config/fallback_assets.yml") }

  before(:each) do
    stub_const "Rails", double(root: "spec/fixtures")
    stub_const "ENV", {"RAILS_ENV" => "development"}
  end

  include FallbackAssets::Helper

  describe "#fallback_stylesheet" do

    it "returns an stylesheet link tag" do
      expect(fallback_stylesheet(:normalize)).to eq "<link rel=\"stylesheet\" href=\"normalize.css\" />"
    end

  end

  describe "#fallback_javascript" do

    it "returns an script tag" do
      expect(fallback_javascript(:jquery)).to eq "<script src=\"jquery.js\"></script>"
    end

  end

end
