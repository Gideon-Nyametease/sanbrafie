class AddPriceAndCurrencyToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :price, :decimal
    add_column :tours, :currency, :string
  end
end
