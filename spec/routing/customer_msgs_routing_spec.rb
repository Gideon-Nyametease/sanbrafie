require "rails_helper"

RSpec.describe CustomerMsgsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/customer_msgs").to route_to("customer_msgs#index")
    end

    it "routes to #new" do
      expect(get: "/customer_msgs/new").to route_to("customer_msgs#new")
    end

    it "routes to #show" do
      expect(get: "/customer_msgs/1").to route_to("customer_msgs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/customer_msgs/1/edit").to route_to("customer_msgs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/customer_msgs").to route_to("customer_msgs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/customer_msgs/1").to route_to("customer_msgs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/customer_msgs/1").to route_to("customer_msgs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/customer_msgs/1").to route_to("customer_msgs#destroy", id: "1")
    end
  end
end
