class AddActiveStatusToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :active_status, :boolean, default: true
    add_column :tours, :del_status, :boolean, default: false
  end
end
