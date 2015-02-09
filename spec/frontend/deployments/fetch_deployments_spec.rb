require "frontend/deployments/fetch_deployments"

describe Frontend::Deployments::FetchDeployments do
  let(:data) {{ name: "deployment-name" }}
  let(:parsed_response) { double(parsed_response: [data]) }

  it "calls Registrar::Deployment::FetchAll.[]" do
    allow(Registrar::Deployment::FetchAll).to receive(:[]).and_return(parsed_response)

    described_class.new.execute

    expect(Registrar::Deployment::FetchAll).to have_received(:[])
  end

  it "returns an array of Deployments" do
    allow(Registrar::Deployment::FetchAll).to receive(:[]).and_return(parsed_response)

    service = described_class.new

    expect(service.execute.first).to be_kind_of(Frontend::Deployments::Deployment)
  end
end
