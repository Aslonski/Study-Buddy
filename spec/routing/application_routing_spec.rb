require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  it "GET / routes to sessions#new" do
    expect(:get => "/").to route_to("sessions#new")
  end
end

