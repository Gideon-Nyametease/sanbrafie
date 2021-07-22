class CreateCustomerMsgs < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_msgs do |t|
      t.string :email
      t.string :surname
      t.string :othernames
      t.text :message
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
