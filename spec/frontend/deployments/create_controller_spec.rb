require "httparty"
require "frontend/deployments/create_controller"

describe Frontend::Deployments::CreateController do
  let(:mock_deployment) { double(id: "id") }

  it "redirects to show page" do
    allow(Frontend::Deployments::CreateDeployment).to receive(:[]).and_return(mock_deployment)

    response = described_class.new.call({test: true})
    status, headers, _ = response
    expect(status).to eq(302)
    expect(headers["Location"]).to eq("/deployments/id")
  end
end
