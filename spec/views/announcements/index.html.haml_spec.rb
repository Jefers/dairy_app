require 'spec_helper'

describe "announcements/index.html.haml" do
  before(:each) do
    assign(:announcements, [
      stub_model(Announcement,
        :title => "Title",
        :news => "MyText",
        :active => false
      ),
      stub_model(Announcement,
        :title => "Title",
        :news => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of announcements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
