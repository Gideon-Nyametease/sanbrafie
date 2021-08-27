require 'rails_helper'

RSpec.describe "user_testimonials/index", type: :view do
  before(:each) do
    assign(:user_testimonials, [
      UserTestimonial.create!(
        fullname: "Fullname",
        trip: "Trip",
        testimonial: "MyText"
      ),
      UserTestimonial.create!(
        fullname: "Fullname",
        trip: "Trip",
        testimonial: "MyText"
      )
    ])
  end

  it "renders a list of user_testimonials" do
    render
    assert_select "tr>td", text: "Fullname".to_s, count: 2
    assert_select "tr>td", text: "Trip".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
