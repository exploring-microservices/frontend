require "frontend/deployments/index_controller"
require "frontend/deployments/index"

describe Frontend::Deployments::IndexController do
  let(:action) { described_class.new }
  let(:response) { action.call({}) }
  let(:view) { Frontend::Deployments::Index }

  def rendered_html
    view.render(format: :html)
  end

  it "renders the index view" do
    _, _, body = response
    expect(body).to contain_exactly(rendered_html)
  end
end
