require "frontend/deployments/fetch_deployments"

describe Frontend::Deployments::FetchDeployments do
  let(:data) {{ name: "name" }}
  let(:parsed_response) { double(parsed_response: [data]) }

  it "calls Registrar::Deployments::FetchAll.[]" do
    allow(Registrar::Deployments::FetchAll).to receive(:[]).and_return(parsed_response)

    described_class.new.execute

    expect(Registrar::Deployments::FetchAll).to have_received(:[])
  end

  it "returns an array of Deployments" do
    allow(Registrar::Deployments::FetchAll).to receive(:[]).and_return(parsed_response)

    service = described_class.new

    expect(service.execute.first).to be_kind_of(Frontend::Deployments::Deployment)
  end
end
