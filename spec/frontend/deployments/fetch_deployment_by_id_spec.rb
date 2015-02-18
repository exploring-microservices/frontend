require "frontend/deployments/fetch_deployment_by_id"

describe Frontend::Deployments::FetchDeploymentById do
  let(:deployment) { {id: "test-id", name: "name"} }

  it "calls Registrar::Deployments::FetchAll.[]" do
    allow(Registrar::Deployments::FetchById).to receive(:[]).and_return(deployment)

    described_class["test-id"]

    expect(Registrar::Deployments::FetchById).to have_received(:[])
  end

  it "returns a Deployment" do
    allow(Registrar::Deployments::FetchById).to receive(:[]).and_return(deployment)

    expect(described_class["test-id"]).to be_kind_of(Frontend::Deployments::Deployment)
  end

end

