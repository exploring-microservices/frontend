require "frontend/template/application_layout"

describe Frontend::Template::ApplicationLayout do
  let(:layout) { described_class.new(nil, nil) }

  it "returns Frontend as the title" do
    expect(layout.title).to eq("Frontend")
  end
end
