require "registrar/configuration"

describe Registrar::Configuration do
  context "#registrar_url" do
    it "saves the registrar_url" do
      config = described_class.new
      config.registrar_url = "http://localhost:1234"

      expect(config.registrar_url).to eq("http://localhost:1234")
    end

    it "raises a Registrar::ConfigurationNotSet when config accessed before it's set" do
      config = described_class.new
      expect { config.registrar_url }.to raise_error(Registrar::Configuration::NotSet)
      expect { config.registrar_url }.to raise_error("registrar_url")
    end
  end
end
