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
      normalize_return = "<link rel=\"stylesheet\" href=\"normalize.css\" />"
      String.any_instance.stub(:html_safe).and_return normalize_return

      expect(fallback_stylesheet(:normalize)).to eq normalize_return
    end

  end

  describe "#fallback_javascript" do

    it "returns an script tag" do
      jquery_return = "<script src=\"jquery.js\"></script>"
      String.any_instance.stub(:html_safe).and_return jquery_return

      expect(fallback_javascript(:jquery)).to eq jquery_return
    end

  end

end
