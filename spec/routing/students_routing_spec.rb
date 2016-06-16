require "rails_helper"

RSpec.describe "Routing to students", :type => :routing do
  it "routes GET /students to students#index" do
    expect(:get => "/students").to route_to("students#index")
  end

  it "routes GET /students/new to students#new" do
    expect(:get => "/students/new").to route_to("students#new")
  end

  it "routes GET /students/1 to students#show" do
    expect(:get => "/students/1").to route_to("students#show", :id => "1")
  end

  it "routes POST /students to students#create" do
    expect(:post => "/students").to route_to("students#create")
  end

  it "routes DELETE /students/1 to students#destroy" do
    expect(:delete => "/students/1").to route_to("students#destroy", :id => "1")
  end

  it "routes EDIT /students/1/edit to students#edit" do 
    expect(:get => "/students/1/edit").to route_to("students#edit", :id => "1")
  end

  it "routes UPDATE /students/id to students#update" do 
    expect(:put => "/students/1").to route_to("students#update", :id => "1")
  end
end