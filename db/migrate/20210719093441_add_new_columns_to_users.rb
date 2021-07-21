class AddNewColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active_status, :boolean
    add_column :users, :del_status, :boolean
  end
end
