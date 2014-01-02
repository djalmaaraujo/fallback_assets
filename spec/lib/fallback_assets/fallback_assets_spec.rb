require 'spec_helper'
require 'yaml'

describe FallbackAssets do
  specify { FallbackAssets.should be_a(Module) }

  let(:settings) { YAML.load_file("spec/fixtures/config/fallback_assets.yml") }

  before(:each) do
    stub_const "Rails", double(root: "spec/fixtures")
    stub_const "RAILS_ENV", "development"
  end

  describe "FallbackAssets::JavascriptsAssets" do
    describe "#javascript_include_fallback" do

      it "returns a for production environment" do
        stub_const "RAILS_ENV", "production"
        expect(FallbackAssets::JavascriptsAssets.javascript_include_fallback("a", "b")).to eq "a"
      end

      it "returns b for environments different from production" do
        stub_const "RAILS_ENV", "development"
        expect(FallbackAssets::JavascriptsAssets.javascript_include_fallback("a", "b")).to eq "b"
      end

    end

  end

  describe "FallbackAssets::StylesheetsAssets" do
    describe "#stylesheet_include_fallback" do

      it "returns a for production environment" do
        stub_const "RAILS_ENV", "production"
        expect(FallbackAssets::StylesheetsAssets.stylesheet_include_fallback("a", "b")).to eq "a"
      end

      it "returns b for environments different from production" do
        stub_const "RAILS_ENV", "development"
        expect(FallbackAssets::StylesheetsAssets.stylesheet_include_fallback("a", "b")).to eq "b"
      end

    end

  end

  describe "Configuration File" do
    before do
      YAML.stub(:load_file).with("#{Rails.root}/config/fallback_assets.yml").and_return(settings)
    end

    it "loads the configuration file into settings" do
      expect(FallbackAssets.settings).to equal settings
    end

  end

  describe "Asset loader" do

    describe "#load_asset" do

      it "loads an asset with different types" do
        expect(FallbackAssets.load_asset(:javascripts, :jquery)).to eq "jquery.js"
        expect(FallbackAssets.load_asset(:stylesheets, :normalize)).to eq "normalize.css"
      end

      it 'loads an asset from a different environment' do
        stub_const "RAILS_ENV", "production"
        expect(FallbackAssets.load_asset(:javascripts, :jquery)).to eq "//cdn/jquery.min.js"
      end

      it 'loads an asset from development if environment is crazy' do
        stub_const "RAILS_ENV", "crazyenv"
        expect(FallbackAssets.load_asset(:javascripts, :jquery)).to eq "jquery.js"
      end

    end

  end

end
