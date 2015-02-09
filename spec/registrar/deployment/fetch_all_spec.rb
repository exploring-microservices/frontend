require "webmock/rspec"
require "registrar/deployment/fetch_all"

describe Registrar::Deployment::FetchAll do
  let(:registrar_url) { "http://test.dev:3000" }
  let(:deployment_url) { "#{registrar_url}/deployment" }

  it "makes a get request to {{registrar_url}}/deployments" do
    stub_request(:get, deployment_url)

    described_class.new(registrar_url: registrar_url).execute

    expect(a_request(:get, deployment_url)).to have_been_made
  end

  it "defaults registrar_url to ENV['REGISTRAR_URL']" do
    stub_request(:get, deployment_url)

    ENV["REGISTRAR_URL"] = registrar_url
    described_class.new({}).execute

    expect(a_request(:get, deployment_url)).to have_been_made
  end
end
