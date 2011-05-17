require 'spec_helper'

describe "quicknotes/edit.html.haml" do
  before(:each) do
    @quicknote = assign(:quicknote, stub_model(Quicknote,
      :customer_id => 1,
      :subject => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit quicknote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quicknote_path(@quicknote), :method => "post" do
      assert_select "input#quicknote_customer_id", :name => "quicknote[customer_id]"
      assert_select "input#quicknote_subject", :name => "quicknote[subject]"
      assert_select "textarea#quicknote_note", :name => "quicknote[note]"
    end
  end
end
