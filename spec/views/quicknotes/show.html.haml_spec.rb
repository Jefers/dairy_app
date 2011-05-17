require 'spec_helper'

describe "quicknotes/show.html.haml" do
  before(:each) do
    @quicknote = assign(:quicknote, stub_model(Quicknote,
      :customer_id => 1,
      :subject => "Subject",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
