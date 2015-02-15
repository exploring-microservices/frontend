require "registrar/deployments/fetch_all"

describe Registrar::Deployments::FetchAll do
  let(:registrar_url) { "http://test.dev:3000" }
  let(:deployments_url) { "#{registrar_url}/deployments" }

  it "makes a Registrar::Request get request to /deployments" do
    allow(Registrar::Request).to receive(:get)

    described_class[]

    expect(Registrar::Request).to have_received(:get).with("/deployments")
  end
end
