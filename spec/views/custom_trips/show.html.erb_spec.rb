require 'rails_helper'

RSpec.describe "custom_trips/show", type: :view do
  before(:each) do
    @custom_trip = assign(:custom_trip, CustomTrip.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Othernames/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Coordination Preference/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Hotel Type/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Purpose Statement/)
    expect(rendered).to match(/MyText/)
  end
end
