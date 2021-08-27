require 'rails_helper'

RSpec.describe "user_testimonials/edit", type: :view do
  before(:each) do
    @user_testimonial = assign(:user_testimonial, UserTestimonial.create!(
      fullname: "MyString",
      trip: "MyString",
      testimonial: "MyText"
    ))
  end

  it "renders the edit user_testimonial form" do
    render

    assert_select "form[action=?][method=?]", user_testimonial_path(@user_testimonial), "post" do

      assert_select "input[name=?]", "user_testimonial[fullname]"

      assert_select "input[name=?]", "user_testimonial[trip]"

      assert_select "textarea[name=?]", "user_testimonial[testimonial]"
    end
  end
end
