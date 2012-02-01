require 'spec_helper'

describe "suppliers/show.html.haml" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :name => "Name",
      :address => "Address",
      :address_2 => "Address 2",
      :address_3 => "Address 3",
      :town => "Town",
      :post_code => "Post Code",
      :contact_telephone => "Contact Telephone",
      :email_address => "Email Address",
      :information => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
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
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
