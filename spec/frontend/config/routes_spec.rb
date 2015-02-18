require "frontend/config/routes"

describe Frontend::Config::Routes do
  def mock_request(routes)
    Rack::MockRequest.new(routes)
  end

  it "responds with 200 on GET /" do
    allow(Frontend::Deployments::FetchDeployments).to receive(:[]).and_return([])

    response = mock_request(described_class.new).get("/")
    expect(response.status).to eq(200)
  end

  it "responds with 200 on GET /deployments/test-id" do
    allow(Frontend::Deployments::FetchDeploymentById).to receive(:[]).and_return(double(name: nil))

    response = mock_request(described_class.new).get("/deployments/test-id")
    expect(response.status).to eq(200)
  end

  it "response with 302 on POST /deployments/create" do
    allow(Frontend::Deployments::CreateDeployment).to receive(:[]).and_return(double(id: 1))

    response = mock_request(described_class.new).post("/deployments/create")
    expect(response.status).to eq(302)
  end
end
