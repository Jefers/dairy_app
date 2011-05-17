require 'spec_helper'

describe "Quicknotes" do
  describe "GET /quicknotes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get quicknotes_path
      response.status.should be(200)
    end
  end
end
