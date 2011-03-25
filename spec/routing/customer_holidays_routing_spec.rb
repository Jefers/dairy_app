require "spec_helper"

describe CustomerHolidaysController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/customer_holidays" }.should route_to(:controller => "customer_holidays", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/customer_holidays/new" }.should route_to(:controller => "customer_holidays", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/customer_holidays/1" }.should route_to(:controller => "customer_holidays", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/customer_holidays/1/edit" }.should route_to(:controller => "customer_holidays", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/customer_holidays" }.should route_to(:controller => "customer_holidays", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/customer_holidays/1" }.should route_to(:controller => "customer_holidays", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/customer_holidays/1" }.should route_to(:controller => "customer_holidays", :action => "destroy", :id => "1")
    end

  end
end
