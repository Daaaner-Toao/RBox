require "rails_helper"

RSpec.describe PackagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/packages").to route_to("packages#index")
      expect(:get => "/").to route_to("packages#index")
    end


    # it's slightly confusing but it makes sense, as the update link
    # is used to actually update the whole db which generally means
    # to search and create new elements
    # and update is reserved for the sinlge update from the view
    it "routes to #update" do
      expect(:get => "/update").to route_to("packages#create")
    end


  end
end
