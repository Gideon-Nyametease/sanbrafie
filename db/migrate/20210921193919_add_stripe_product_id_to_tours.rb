class AddStripeProductIdToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :stripe_product_id, :string
  end
end
