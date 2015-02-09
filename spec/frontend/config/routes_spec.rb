require "frontend/config/routes"

describe Frontend::Config::Routes do
  let(:routes) { described_class.new }
  let(:mock_request) { Rack::MockRequest.new(routes) }

  it "responds with 200 on GET /" do
    response = mock_request.get("/")
    expect(response.status).to eq(200)
  end
end
