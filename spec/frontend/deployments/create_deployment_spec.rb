require "frontend/deployments/create_deployment"

describe Frontend::Deployments::CreateDeployment do
  let(:deployment) {{
    name: "name",
    source: {
      type: "git",
      url: "git://git@github.com:test/repository.git",
      branch: "master"
    },
    destination: {
      type: "git",
      url: "git://git@github.com:test/repository.git",
      branch: "gh-pages"
    }
  }}

  it "calls Registrar::Deployments::Create.[]" do
    allow(Registrar::Deployments::Create).to receive(:[]).and_return(deployment)

    described_class.new(deployment).execute

    expect(Registrar::Deployments::Create).to have_received(:[]).with(deployment)
  end

  it "returns a Deployment" do
    allow(Registrar::Deployments::Create).to receive(:[]).and_return(deployment)

    service = described_class.new(deployment)

    expect(service.execute).to be_kind_of(Frontend::Deployments::Deployment)
  end
end
