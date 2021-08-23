require "rails_helper"

RSpec.describe CustomTripsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/custom_trips").to route_to("custom_trips#index")
    end

    it "routes to #new" do
      expect(get: "/custom_trips/new").to route_to("custom_trips#new")
    end

    it "routes to #show" do
      expect(get: "/custom_trips/1").to route_to("custom_trips#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/custom_trips/1/edit").to route_to("custom_trips#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/custom_trips").to route_to("custom_trips#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/custom_trips/1").to route_to("custom_trips#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/custom_trips/1").to route_to("custom_trips#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/custom_trips/1").to route_to("custom_trips#destroy", id: "1")
    end
  end
end
