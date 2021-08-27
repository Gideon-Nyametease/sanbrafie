require "rails_helper"

RSpec.describe UserTestimonialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_testimonials").to route_to("user_testimonials#index")
    end

    it "routes to #new" do
      expect(get: "/user_testimonials/new").to route_to("user_testimonials#new")
    end

    it "routes to #show" do
      expect(get: "/user_testimonials/1").to route_to("user_testimonials#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user_testimonials/1/edit").to route_to("user_testimonials#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_testimonials").to route_to("user_testimonials#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_testimonials/1").to route_to("user_testimonials#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_testimonials/1").to route_to("user_testimonials#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_testimonials/1").to route_to("user_testimonials#destroy", id: "1")
    end
  end
end
