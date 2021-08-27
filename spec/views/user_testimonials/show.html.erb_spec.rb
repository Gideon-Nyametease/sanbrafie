require 'rails_helper'

RSpec.describe "user_testimonials/show", type: :view do
  before(:each) do
    @user_testimonial = assign(:user_testimonial, UserTestimonial.create!(
      fullname: "Fullname",
      trip: "Trip",
      testimonial: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fullname/)
    expect(rendered).to match(/Trip/)
    expect(rendered).to match(/MyText/)
  end
end
