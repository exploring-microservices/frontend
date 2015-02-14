require "webmock/rspec"
require "registrar/deployments/create"

describe Registrar::Deployments::Create do
  let(:registrar_url) { "http://test.dev:3000" }
  let(:deployments_url) { "#{registrar_url}/deployments" }
  let(:deployment_data) { {"name" => "deployment-name"} }

  it "makes a post request to {{registrar_url}}/deployments" do
    stub_request(:post, deployments_url)

    described_class.new({}, registrar_url: registrar_url).execute

    expect(a_request(:post, deployments_url)).to have_been_made
  end

  it "defaults registrar_url to ENV['REGISTRAR_URL']" do
    stub_request(:post, deployments_url)

    ENV["REGISTRAR_URL"] = registrar_url
    described_class.new({}).execute

    expect(a_request(:post, deployments_url)).to have_been_made
  end

  it "passes the deployment_data as a json body" do
    stub_request(:post, deployments_url)

    described_class.new(deployment_data, registrar_url: registrar_url).execute

    request = a_request(:post, deployments_url).with do |req|
      req.body == deployment_data.to_json &&
      req.headers["Content-Type"] == "application/json"
    end

    expect(request).to have_been_made
  end

  it "returns the parsed_response" do
    stub_request(:post, deployments_url).to_return({
      headers: {"Content-type" => "application/json" },
      body: deployment_data.to_json
    })

    expect(described_class[deployment_data]).to eq(deployment_data)
  end
end
