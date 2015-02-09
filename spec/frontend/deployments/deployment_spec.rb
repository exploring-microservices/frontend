require "frontend/deployments/deployment"

describe Frontend::Deployments::Deployment do
  let(:valid_data) {{
    name: "deployment-name",
    source: {
      type: "git",
      url: "git://git@github.com:test/repository.git",
      branch: "master"
    },
    destination: {
      type: "git",
      url: "git://git@github.com:test/repository.git",
      branch: "gh-pages"
    }
  }}

  let(:invalid_data) {{
    name: "deployment-name",
    source: {},
    destination: {}
  }}

  it "returns true when name, source and destination keys are set" do
    deployment = described_class.new(valid_data)
    expect(deployment).to be_valid
  end

  it "returns false when data is not valid" do
    expect(described_class.new(invalid_data)).to_not be_valid
  end
end
