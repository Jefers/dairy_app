require 'spec_helper'

describe "announcements/show.html.haml" do
  before(:each) do
    @announcement = assign(:announcement, stub_model(Announcement,
      :title => "Title",
      :news => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
