 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/customer_msgs", type: :request do
  
  # CustomerMsg. As you add validations to CustomerMsg, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CustomerMsg.create! valid_attributes
      get customer_msgs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      customer_msg = CustomerMsg.create! valid_attributes
      get customer_msg_url(customer_msg)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_customer_msg_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      customer_msg = CustomerMsg.create! valid_attributes
      get edit_customer_msg_url(customer_msg)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CustomerMsg" do
        expect {
          post customer_msgs_url, params: { customer_msg: valid_attributes }
        }.to change(CustomerMsg, :count).by(1)
      end

      it "redirects to the created customer_msg" do
        post customer_msgs_url, params: { customer_msg: valid_attributes }
        expect(response).to redirect_to(customer_msg_url(CustomerMsg.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CustomerMsg" do
        expect {
          post customer_msgs_url, params: { customer_msg: invalid_attributes }
        }.to change(CustomerMsg, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post customer_msgs_url, params: { customer_msg: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested customer_msg" do
        customer_msg = CustomerMsg.create! valid_attributes
        patch customer_msg_url(customer_msg), params: { customer_msg: new_attributes }
        customer_msg.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the customer_msg" do
        customer_msg = CustomerMsg.create! valid_attributes
        patch customer_msg_url(customer_msg), params: { customer_msg: new_attributes }
        customer_msg.reload
        expect(response).to redirect_to(customer_msg_url(customer_msg))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        customer_msg = CustomerMsg.create! valid_attributes
        patch customer_msg_url(customer_msg), params: { customer_msg: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested customer_msg" do
      customer_msg = CustomerMsg.create! valid_attributes
      expect {
        delete customer_msg_url(customer_msg)
      }.to change(CustomerMsg, :count).by(-1)
    end

    it "redirects to the customer_msgs list" do
      customer_msg = CustomerMsg.create! valid_attributes
      delete customer_msg_url(customer_msg)
      expect(response).to redirect_to(customer_msgs_url)
    end
  end
end
