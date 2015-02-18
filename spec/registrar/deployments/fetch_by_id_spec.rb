require "registrar/deployments/fetch_by_id"

describe Registrar::Deployments::FetchById do
  it "makes a Registrar::Request get request to /deployments/test-id" do
    allow(Registrar::Request).to receive(:get)

    described_class["test-id"]

    expect(Registrar::Request).to have_received(:get).with("/deployments/test-id")
  end
end
