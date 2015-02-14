require "frontend/deployments/fetch_deployments"

describe Frontend::Deployments::FetchDeployments do
  let(:deployments) { [{name: "name"}, {name: "name-2"}] }

  it "calls Registrar::Deployments::FetchAll.[]" do
    allow(Registrar::Deployments::FetchAll).to receive(:[]).and_return(deployments)

    described_class[]

    expect(Registrar::Deployments::FetchAll).to have_received(:[])
  end

  it "returns an array of Deployments" do
    allow(Registrar::Deployments::FetchAll).to receive(:[]).and_return(deployments)

    described_class[].each do |deployment|
      expect(deployment).to be_kind_of(Frontend::Deployments::Deployment)
    end

  end
end
