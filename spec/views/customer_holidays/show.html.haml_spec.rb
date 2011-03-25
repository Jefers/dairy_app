require 'spec_helper'

describe "customer_holidays/show.html.haml" do
  before(:each) do
    @customer_holiday = assign(:customer_holiday, stub_model(CustomerHoliday,
      :customer_id => 1,
      :title => "Title",
      :urn => "Urn",
      :round => "Round",
      :first_name => "First Name",
      :last_name => "Last Name",
      :address => "Address",
      :address_2 => "Address 2",
      :address_3 => "Address 3",
      :town => "Town",
      :post_code => "Post Code",
      :contact_telephone => "Contact Telephone",
      :email_address => "Email Address",
      :confirmed => false,
      :notes => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Urn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Round/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address 3/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Town/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Post Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Telephone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
