require "rails_helper"

RSpec.describe PackagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/packages").to route_to("packages#index")
      expect(:get => "/").to route_to("packages#index")
    end

    it "routes to #update" do
      expect(:get => "/update").to route_to("packages#update")
    end

    it "routes to #create" do
      expect(:get => "/create").to route_to("packages#create")
    end


  end
end
