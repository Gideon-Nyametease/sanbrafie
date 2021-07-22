require 'rails_helper'

RSpec.describe "customer_msgs/show", type: :view do
  before(:each) do
    @customer_msg = assign(:customer_msg, CustomerMsg.create!(
      email: "Email",
      surname: "Surname",
      othernames: "Othernames",
      message: "MyText",
      user_id: 2,
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Othernames/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Status/)
  end
end
