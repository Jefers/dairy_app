require 'spec_helper'

describe "customer_holidays/new.html.haml" do
  before(:each) do
    assign(:customer_holiday, stub_model(CustomerHoliday,
      :customer_id => 1,
      :title => "MyString",
      :urn => "MyString",
      :round => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :address => "MyString",
      :address_2 => "MyString",
      :address_3 => "MyString",
      :town => "MyString",
      :post_code => "MyString",
      :contact_telephone => "MyString",
      :email_address => "MyString",
      :confirmed => false,
      :notes => "MyText",
      :active => false
    ).as_new_record)
  end

  it "renders new customer_holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customer_holidays_path, :method => "post" do
      assert_select "input#customer_holiday_customer_id", :name => "customer_holiday[customer_id]"
      assert_select "input#customer_holiday_title", :name => "customer_holiday[title]"
      assert_select "input#customer_holiday_urn", :name => "customer_holiday[urn]"
      assert_select "input#customer_holiday_round", :name => "customer_holiday[round]"
      assert_select "input#customer_holiday_first_name", :name => "customer_holiday[first_name]"
      assert_select "input#customer_holiday_last_name", :name => "customer_holiday[last_name]"
      assert_select "input#customer_holiday_address", :name => "customer_holiday[address]"
      assert_select "input#customer_holiday_address_2", :name => "customer_holiday[address_2]"
      assert_select "input#customer_holiday_address_3", :name => "customer_holiday[address_3]"
      assert_select "input#customer_holiday_town", :name => "customer_holiday[town]"
      assert_select "input#customer_holiday_post_code", :name => "customer_holiday[post_code]"
      assert_select "input#customer_holiday_contact_telephone", :name => "customer_holiday[contact_telephone]"
      assert_select "input#customer_holiday_email_address", :name => "customer_holiday[email_address]"
      assert_select "input#customer_holiday_confirmed", :name => "customer_holiday[confirmed]"
      assert_select "textarea#customer_holiday_notes", :name => "customer_holiday[notes]"
      assert_select "input#customer_holiday_active", :name => "customer_holiday[active]"
    end
  end
end
