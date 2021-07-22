require 'rails_helper'

RSpec.describe "customer_msgs/index", type: :view do
  before(:each) do
    assign(:customer_msgs, [
      CustomerMsg.create!(
        email: "Email",
        surname: "Surname",
        othernames: "Othernames",
        message: "MyText",
        user_id: 2,
        status: "Status"
      ),
      CustomerMsg.create!(
        email: "Email",
        surname: "Surname",
        othernames: "Othernames",
        message: "MyText",
        user_id: 2,
        status: "Status"
      )
    ])
  end

  it "renders a list of customer_msgs" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Surname".to_s, count: 2
    assert_select "tr>td", text: "Othernames".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
