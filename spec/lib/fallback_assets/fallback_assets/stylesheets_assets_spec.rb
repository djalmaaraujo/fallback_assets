require 'spec_helper'

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
