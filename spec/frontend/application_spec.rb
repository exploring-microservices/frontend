require "frontend/application"

describe Frontend::Application do
  def valid_rack_response?(response)
    status, headers, body = response
    expect(status).to be_kind_of(Fixnum)
    expect(headers).to be_kind_of(Hash)
    expect(body).to be_kind_of(Array)
  end

  describe "#call" do
    let(:response) { described_class.new.call({}) }

    it "returns a valid rack response" do
      valid_rack_response?(response)
    end
  end
end
