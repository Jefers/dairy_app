require 'spec_helper'

describe Product do
  before(:each) do
    @attr = {
      :name => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@attr)
  end

end
