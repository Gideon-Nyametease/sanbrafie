class AddSalesCountToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :sales_count, :integer
    change_column :tours, :price, :integer
  end
end
