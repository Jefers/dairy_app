require 'spec_helper'

describe "announcements/new.html.haml" do
  before(:each) do
    assign(:announcement, stub_model(Announcement,
      :title => "MyString",
      :news => "MyText",
      :active => false
    ).as_new_record)
  end

  it "renders new announcement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => announcements_path, :method => "post" do
      assert_select "input#announcement_title", :name => "announcement[title]"
      assert_select "textarea#announcement_news", :name => "announcement[news]"
      assert_select "input#announcement_active", :name => "announcement[active]"
    end
  end
end
