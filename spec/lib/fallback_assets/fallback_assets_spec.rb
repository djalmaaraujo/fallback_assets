require 'spec_helper'

describe FallbackAssets do
  specify { FallbackAssets.should be_a(Module) }

  describe "Lib Version" do

    it "must have a valid version" do
      FallbackAssets::VERSION.should_not be_nil
      FallbackAssets::VERSION.should be_a_kind_of String
    end

  end

  describe "FallbackAssets::JavascriptsAssets" do
    describe "#javascript_include_fallback" do

      it "returns a for production environment" do
        RAILS_ENV = "production"
        expect(FallbackAssets::JavascriptsAssets.javascript_include_fallback("a", "b")).to eq "a"
      end

      it "returns b for environments different from production" do
        RAILS_ENV = "development"
        expect(FallbackAssets::JavascriptsAssets.javascript_include_fallback("a", "b")).to eq "b"
      end

    end

  end

  describe "FallbackAssets::StylesheetsAssets" do
    describe "#stylesheet_include_fallback" do

      it "returns a for production environment" do
        RAILS_ENV = "production"
        expect(FallbackAssets::StylesheetsAssets.stylesheet_include_fallback("a", "b")).to eq "a"
      end

      it "returns b for environments different from production" do
        RAILS_ENV = "development"
        expect(FallbackAssets::StylesheetsAssets.stylesheet_include_fallback("a", "b")).to eq "b"
      end

    end

  end

end
