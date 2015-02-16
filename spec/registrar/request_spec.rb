require "webmock/rspec"
require "registrar/request"

describe Registrar::Request do
  let(:registrar_url) { "http://test.dev:3000" }
  let(:endpoint) { "/deployments" }
  let(:deployments_url) { registrar_url + endpoint }
  let(:data) { {"test" => true} }

  around do |example|
    Registrar.configure do |configuration|
      configuration.registrar_url = registrar_url
    end

    example.run

    Registrar.reset
  end

  it "makes a GET request to {{registrar_url}}/deployments" do
    stub_request(:get, deployments_url)

    described_class.get("/deployments")

    expect(a_request(:get, deployments_url)).to have_been_made
  end

  it "returns the parsed_response" do
    stub_request(:get, deployments_url).to_return({
      headers: { "Content-type" => "application/json" },
      body: data.to_json
    })

    response = described_class.get("/deployments")

    expect(response).to eq(data)
  end

  it "includes the data passed in" do
    stub_request(:post, deployments_url)

    response = described_class.post("/deployments", data)

    request = a_request(:post, deployments_url).with do |req|
      req.body == data.to_json
    end

    expect(request).to have_been_made
  end

  it "sets the content-type to application/json" do
    stub_request(:post, deployments_url)

    response = described_class.post("/deployments", data)

    request = a_request(:post, deployments_url).with do |req|
      req.headers["Content-Type"] == "application/json"
    end

    expect(request).to have_been_made
  end
end
