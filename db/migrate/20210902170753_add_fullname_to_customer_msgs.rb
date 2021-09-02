class AddFullnameToCustomerMsgs < ActiveRecord::Migration[6.1]
  def change
    add_column :customer_msgs, :full_name, :string
  end
end
