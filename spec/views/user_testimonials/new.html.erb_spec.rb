require 'rails_helper'

RSpec.describe "user_testimonials/new", type: :view do
  before(:each) do
    assign(:user_testimonial, UserTestimonial.new(
      fullname: "MyString",
      trip: "MyString",
      testimonial: "MyText"
    ))
  end

  it "renders new user_testimonial form" do
    render

    assert_select "form[action=?][method=?]", user_testimonials_path, "post" do

      assert_select "input[name=?]", "user_testimonial[fullname]"

      assert_select "input[name=?]", "user_testimonial[trip]"

      assert_select "textarea[name=?]", "user_testimonial[testimonial]"
    end
  end
end
