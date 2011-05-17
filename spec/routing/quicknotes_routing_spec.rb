require "spec_helper"

describe QuicknotesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/quicknotes" }.should route_to(:controller => "quicknotes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/quicknotes/new" }.should route_to(:controller => "quicknotes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/quicknotes/1" }.should route_to(:controller => "quicknotes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/quicknotes/1/edit" }.should route_to(:controller => "quicknotes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/quicknotes" }.should route_to(:controller => "quicknotes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/quicknotes/1" }.should route_to(:controller => "quicknotes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/quicknotes/1" }.should route_to(:controller => "quicknotes", :action => "destroy", :id => "1")
    end

  end
end
