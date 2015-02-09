require "frontend/deployments/create_deployment"

describe Frontend::Deployments::CreateDeployment do
  let(:data) {{
    name: "deployment-name",
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
  let(:parsed_response) { double(parsed_response: data) }


  it "calls Registrar::Deployment::Create.[]" do
    allow(Registrar::Deployment::Create).to receive(:[]).and_return(parsed_response)

    described_class.new(data).execute

    expect(Registrar::Deployment::Create).to have_received(:[]).with(data)
  end

  it "returns a Deployment" do
    allow(Registrar::Deployment::Create).to receive(:[]).and_return(parsed_response)

    service = described_class.new(data)

    expect(service.execute).to be_kind_of(Frontend::Deployments::Deployment)
  end
end
