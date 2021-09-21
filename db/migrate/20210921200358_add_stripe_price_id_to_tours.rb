class AddStripePriceIdToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :stripe_price_id, :string
  end
end
