require "rails_helper"

RSpec.describe "Routing to login", :type => :routing do
  it "routes GET /sessions/new to sessions#new" do
    expect(:get => "/sessions/new").to route_to("sessions#new")
  end

  it "routes POST /sessions to sessions#create" do
    expect(:post => "/sessions").to route_to("sessions#create")
  end

  it "routes DELETE /sessions/1 to sessions#destroy" do
    expect(:delete => "/sessions/1").to route_to("sessions#destroy", :id => "1")
  end
end