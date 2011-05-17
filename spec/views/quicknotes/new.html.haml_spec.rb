require 'spec_helper'

describe "quicknotes/new.html.haml" do
  before(:each) do
    assign(:quicknote, stub_model(Quicknote,
      :customer_id => 1,
      :subject => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new quicknote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quicknotes_path, :method => "post" do
      assert_select "input#quicknote_customer_id", :name => "quicknote[customer_id]"
      assert_select "input#quicknote_subject", :name => "quicknote[subject]"
      assert_select "textarea#quicknote_note", :name => "quicknote[note]"
    end
  end
end
