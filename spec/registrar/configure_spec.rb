require "registrar/configure"

describe Registrar do
  context ".configure" do
    it "can set registrar_url" do
      described_class.configure do |config|
        config.registrar_url = "http://localhost:1234"
      end

      expect(described_class.configuration.registrar_url).to eq("http://localhost:1234")
    end
  end

  context ".reset" do
    it "resets the configuration" do
      described_class.configure do |config|
        config.registrar_url = "http://localhost:1234"
      end

      described_class.reset

      expect {described_class.configuration.registrar_url}.to raise_error
    end
  end
end
