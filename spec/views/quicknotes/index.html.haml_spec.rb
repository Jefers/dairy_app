require 'spec_helper'

describe "quicknotes/index.html.haml" do
  before(:each) do
    assign(:quicknotes, [
      stub_model(Quicknote,
        :customer_id => 1,
        :subject => "Subject",
        :note => "MyText"
      ),
      stub_model(Quicknote,
        :customer_id => 1,
        :subject => "Subject",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of quicknotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
