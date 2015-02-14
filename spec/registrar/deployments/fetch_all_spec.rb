require "webmock/rspec"
require "registrar/deployments/fetch_all"

describe Registrar::Deployments::FetchAll do
  let(:registrar_url) { "http://test.dev:3000" }
  let(:deployments_url) { "#{registrar_url}/deployments" }

  it "makes a get request to {{registrar_url}}/deployments" do
    stub_request(:get, deployments_url)

    described_class[registrar_url: registrar_url]

    expect(a_request(:get, deployments_url)).to have_been_made
  end

  it "defaults registrar_url to ENV['REGISTRAR_URL']" do
    stub_request(:get, deployments_url)

    ENV["REGISTRAR_URL"] = registrar_url
    described_class[]

    expect(a_request(:get, deployments_url)).to have_been_made
  end

  it "returns the parsed response" do
    test_data = {"test" => true}
    stub_request(:get, deployments_url).to_return({
      headers: {"Content-type" => "application/json" },
      body: test_data.to_json
    })

    expect(described_class[]).to eq(test_data)
  end
end
