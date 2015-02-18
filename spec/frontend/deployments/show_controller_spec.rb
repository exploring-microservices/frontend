require "frontend/deployments/show_controller"
require "frontend/deployments/show"
require "frontend/deployments/deployment"

describe Frontend::Deployments::ShowController do
  let(:action) { described_class.new }
  let(:response) { action.call({id: "test-id"}) }
  let(:view) { Frontend::Deployments::Show }
  let(:deployment) { Frontend::Deployments::Deployment.new }

  def rendered_html
    view.render(format: :html, deployment: deployment)
  end

  it "renders the show view" do
    allow(Frontend::Deployments::FetchDeploymentById).to receive(:[]).and_return(deployment)

    _, _, body = response
    expect(body).to contain_exactly(rendered_html)
  end
end
