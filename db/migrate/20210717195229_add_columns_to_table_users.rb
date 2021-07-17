class AddColumnsToTableUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :surname, :string
    add_column :users, :othernames, :string
  end
end

