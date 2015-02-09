require "webmock/rspec"
require "registrar/deployments/create"

describe Registrar::Deployments::Create do
  let(:registrar_url) { "http://test.dev:3000" }
  let(:deployments_url) { "#{registrar_url}/deployments" }

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

  it "passes the data as a json body" do
    stub_request(:post, deployments_url)

    data = {test: true}
    described_class.new(data, registrar_url: registrar_url).execute

    request = a_request(:post, deployments_url).with do |req|
      req.body == data.to_json &&
      req.headers["Content-Type"] == "application/json"
    end


    expect(request).to have_been_made
  end
end
