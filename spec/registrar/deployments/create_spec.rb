require "registrar/deployments/create"

describe Registrar::Deployments::Create do
  let(:deployment_data) { {"name" => "deployment-name"} }

  it "makes a Registrar::Request post request to /deployments with data" do
    allow(Registrar::Request).to receive(:post)

    described_class[deployment_data]

    expect(Registrar::Request).to have_received(:post).with("/deployments", deployment_data)
  end
end
