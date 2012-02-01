require 'spec_helper'

describe "suppliers/edit.html.haml" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :name => "MyString",
      :address => "MyString",
      :address_2 => "MyString",
      :address_3 => "MyString",
      :town => "MyString",
      :post_code => "MyString",
      :contact_telephone => "MyString",
      :email_address => "MyString",
      :information => "MyText",
      :active => false
    ))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplier_path(@supplier), :method => "post" do
      assert_select "input#supplier_name", :name => "supplier[name]"
      assert_select "input#supplier_address", :name => "supplier[address]"
      assert_select "input#supplier_address_2", :name => "supplier[address_2]"
      assert_select "input#supplier_address_3", :name => "supplier[address_3]"
      assert_select "input#supplier_town", :name => "supplier[town]"
      assert_select "input#supplier_post_code", :name => "supplier[post_code]"
      assert_select "input#supplier_contact_telephone", :name => "supplier[contact_telephone]"
      assert_select "input#supplier_email_address", :name => "supplier[email_address]"
      assert_select "textarea#supplier_information", :name => "supplier[information]"
      assert_select "input#supplier_active", :name => "supplier[active]"
    end
  end
end
