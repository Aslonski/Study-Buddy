require "rails_helper"

RSpec.describe "Routing to teachers", :type => :routing do
  it "routes GET /teachers to teachers#index" do
    expect(:get => "/teachers").to route_to("teachers#index")
  end

  it "routes GET /teachers/new to teachers#new" do
    expect(:get => "/teachers/new").to route_to("teachers#new")
  end

  it "routes GET /teachers/1 to teachers#show" do
    expect(:get => "/teachers/1").to route_to("teachers#show", :id => "1")
  end

  it "routes POST /teachers to teachers#create" do
    expect(:post => "/teachers").to route_to("teachers#create")
  end

  it "routes DELETE /teachers/1 to teachers#destroy" do
    expect(:delete => "/teachers/1").to route_to("teachers#destroy", :id => "1")
  end

  it "routes EDIT /teachers/1/edit to teachers#edit" do 
    expect(:get => "/teachers/1/edit").to route_to("teachers#edit", :id => "1")
  end

  it "routes UPDATE /teachers/id to teachers#update" do 
    expect(:put => "/teachers/1").to_not be_routable
  end
end