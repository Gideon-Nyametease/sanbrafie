require 'rails_helper'

RSpec.describe "custom_trips/new", type: :view do
  before(:each) do
    assign(:custom_trip, CustomTrip.new(
      destination: "MyString",
      surname: "MyString",
      othernames: "MyString",
      email: "MyString",
      phone_number: "MyString",
      coordination_preference: "MyString",
      group_count: 1,
      hotel_type: "MyString",
      trip_duration: 1,
      purpose_statement: "MyString",
      comment: "MyText"
    ))
  end

  it "renders new custom_trip form" do
    render

    assert_select "form[action=?][method=?]", custom_trips_path, "post" do

      assert_select "input[name=?]", "custom_trip[destination]"

      assert_select "input[name=?]", "custom_trip[surname]"

      assert_select "input[name=?]", "custom_trip[othernames]"

      assert_select "input[name=?]", "custom_trip[email]"

      assert_select "input[name=?]", "custom_trip[phone_number]"

      assert_select "input[name=?]", "custom_trip[coordination_preference]"

      assert_select "input[name=?]", "custom_trip[group_count]"

      assert_select "input[name=?]", "custom_trip[hotel_type]"

      assert_select "input[name=?]", "custom_trip[trip_duration]"

      assert_select "input[name=?]", "custom_trip[purpose_statement]"

      assert_select "textarea[name=?]", "custom_trip[comment]"
    end
  end
end
