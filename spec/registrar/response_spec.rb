require "registrar/response"

describe Registrar::Response do
  def exception(message=nil)
    Exception.new(message)
  end

  context "#data" do
    it "is the original data" do
      data = { test: true }
      expect(described_class.new(data: data).data).to eq(data)
    end
  end

  context "#error?" do
    it "is true when error is passed in" do
      response = described_class.new(error: exception)
      expect(response).to have_error
    end

    it "is false when error is not passed in" do
      response = described_class.new
      expect(response).to_not have_error
    end
  end

  context "#error_message" do
    it "is the error message for the error" do
      response = described_class.new(error: exception("not-found"))
      expect(response.error_message).to eq("not-found")
    end

    it "nil if there is no error" do
      response = described_class.new
      expect(response.error_message).to be_nil
    end
  end

  context "#error" do
    it "is the original error" do
      response = described_class.new(error: exception)
      expect(response.error).to eq(exception)
    end
  end
end
