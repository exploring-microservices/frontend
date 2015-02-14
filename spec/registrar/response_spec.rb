require "registrar/response"

describe Registrar::Response do
  context "#data" do
    let(:data) {{ test: true }}

    it "is the original data" do
      expect(described_class.new(data: data).data).to eq(data)
    end
  end

  context "#error?" do
    let(:error) { Exception.new }

    it "is true when error is passed in" do
      response = described_class.new(error: error)
      expect(response).to have_error
    end

    it "is false when error is not passed in" do
      response = described_class.new
      expect(response).to_not have_error
    end
  end

  context "#error_message" do
    let(:error_message) { "Not found" }
    let(:error) { Exception.new(error_message) }

    it "is the error message for the error" do
      response = described_class.new(error: error)
      expect(response.error_message).to eq(error_message)
    end

    it "nil if there is no error" do
      response = described_class.new
      expect(response.error_message).to be_nil
    end
  end

  context "#error" do
    let(:error) { Exception.new }

    it "is the original error" do
      response = described_class.new(error: error)
      expect(response.error).to eq(error)
    end
  end
end
