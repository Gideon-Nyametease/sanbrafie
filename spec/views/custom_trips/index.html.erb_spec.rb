require 'rails_helper'

RSpec.describe "custom_trips/index", type: :view do
  before(:each) do
    assign(:custom_trips, [
      CustomTrip.create!(
        destination: "Destination",
        surname: "Surname",
        othernames: "Othernames",
        email: "Email",
        phone_number: "Phone Number",
        coordination_preference: "Coordination Preference",
        group_count: 2,
        hotel_type: "Hotel Type",
        trip_duration: 3,
        purpose_statement: "Purpose Statement",
        comment: "MyText"
      ),
      CustomTrip.create!(
        destination: "Destination",
        surname: "Surname",
        othernames: "Othernames",
        email: "Email",
        phone_number: "Phone Number",
        coordination_preference: "Coordination Preference",
        group_count: 2,
        hotel_type: "Hotel Type",
        trip_duration: 3,
        purpose_statement: "Purpose Statement",
        comment: "MyText"
      )
    ])
  end

  it "renders a list of custom_trips" do
    render
    assert_select "tr>td", text: "Destination".to_s, count: 2
    assert_select "tr>td", text: "Surname".to_s, count: 2
    assert_select "tr>td", text: "Othernames".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Coordination Preference".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Hotel Type".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Purpose Statement".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
