require 'spec_helper'

describe "announcements/edit.html.haml" do
  before(:each) do
    @announcement = assign(:announcement, stub_model(Announcement,
      :title => "MyString",
      :news => "MyText",
      :active => false
    ))
  end

  it "renders the edit announcement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => announcement_path(@announcement), :method => "post" do
      assert_select "input#announcement_title", :name => "announcement[title]"
      assert_select "textarea#announcement_news", :name => "announcement[news]"
      assert_select "input#announcement_active", :name => "announcement[active]"
    end
  end
end
