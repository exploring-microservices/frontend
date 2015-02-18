require "registrar/deployments/fetch_all"

describe Registrar::Deployments::FetchAll do
  it "makes a Registrar::Request get request to /deployments" do
    allow(Registrar::Request).to receive(:get)

    described_class[]

    expect(Registrar::Request).to have_received(:get).with("/deployments")
  end
end
