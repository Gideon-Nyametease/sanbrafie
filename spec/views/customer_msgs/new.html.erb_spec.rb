require 'rails_helper'

RSpec.describe "customer_msgs/new", type: :view do
  before(:each) do
    assign(:customer_msg, CustomerMsg.new(
      email: "MyString",
      surname: "MyString",
      othernames: "MyString",
      message: "MyText",
      user_id: 1,
      status: "MyString"
    ))
  end

  it "renders new customer_msg form" do
    render

    assert_select "form[action=?][method=?]", customer_msgs_path, "post" do

      assert_select "input[name=?]", "customer_msg[email]"

      assert_select "input[name=?]", "customer_msg[surname]"

      assert_select "input[name=?]", "customer_msg[othernames]"

      assert_select "textarea[name=?]", "customer_msg[message]"

      assert_select "input[name=?]", "customer_msg[user_id]"

      assert_select "input[name=?]", "customer_msg[status]"
    end
  end
end
